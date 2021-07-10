//
//  FriendsViewModel.swift
//  Vk_api
//
//  Created by Valentin Mironov on 10.07.2021.
//

import Foundation
protocol FriendsViewModel {
    var updateTableView: () -> () { get set }
    var numberOfRowInSection: Int { get }
    func getFriendViewModel(forCellWithIndexPath: IndexPath) -> FriendViewModel
    
    
}

class FriendsViewModelImpl: FriendsViewModel {
    private var users: [UserModel] = []
    private let api = FriendsApiServiceImpl()
    
    var numberOfRowInSection: Int { users.count }
    var updateTableView: () -> () = {}
    
    init() {
        loadUsersFromApi()
    }
    
    func getFriendViewModel(forCellWithIndexPath: IndexPath) -> FriendViewModel{
        return FriendViewModelImpl(user: users[forCellWithIndexPath.row])
    }
    
    private func loadUsersFromApi(){
        let userID = Session.share.userId
        let token = Session.share.token
        api.getFriends(params: FriendsRequest(userId: userID, count: 50, token: token)) { [weak self] users, eror in
            guard let self = self else{ return }
            self.users = users
            self.updateTableView()
        }
    }
}
