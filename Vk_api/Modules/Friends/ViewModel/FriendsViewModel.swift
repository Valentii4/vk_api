//
//  FriendsViewModel.swift
//  Vk_api
//
//  Created by Valentin Mironov on 10.07.2021.
//

import Foundation
import RealmSwift
protocol FriendsViewModel {
    var updateTableView: () -> () { get set }
    var numberOfRowInSection: Int { get }
    func getFriendViewModel(forCellWithIndexPath: IndexPath) -> FriendViewModel
    
    
}

class FriendsViewModelImpl: FriendsViewModel {
    private var users: [UserModel] {
        db.getUsers { [weak self] in
            self?.updateTableView()
        }
    }
    private let api = FriendsApiServiceImpl()
    private var db: DatabaseService
    
    var numberOfRowInSection: Int { users.count }
    var updateTableView: () -> () = {}
    
    init?() {
        guard let db = RealmService() else{
            print("Data Base not init")
            return nil
        }
        self.db = db
        self.loadUsersFromApi()
    }
    
    func getFriendViewModel(forCellWithIndexPath: IndexPath) -> FriendViewModel{
        return FriendViewModelImpl(user: users[forCellWithIndexPath.row])
    }
    
    private func loadUsersFromApi(){
        let userID = Session.share.userId
        let token = Session.share.token
        api.getFriends(params: FriendsRequest(userId: userID, count: 50, token: token)) { [weak self] users, eror in
            guard let self = self else{ return }
            do{
                try self.db.saveUsers(users: users)
            }catch{
                print(error)
            }
        }
    }
}
