//
//  RealmService.swift
//  Vk_api
//
//  Created by Valentin Mironov on 11.07.2021.
//

import Foundation
import RealmSwift

class RealmService: DatabaseService {
    private let schemaVersion: UInt64 = 3
    private let realm: Realm
    private var tokenForUsers: NotificationToken?
    init?(){
        let config = Realm.Configuration(schemaVersion: schemaVersion)
        guard let realm = try? Realm(configuration: config) else{ return nil }
        self.realm = realm
        print(realm.configuration.fileURL)
    }
    
    func saveUser(user: UserModel) throws {
        realm.beginWrite()
        realm.add(user)
        try realm.commitWrite()
    }
    
    func getUsers(observe: @escaping () -> ()) -> [UserModel]{
        let users = realm.objects(UserModel.self)
        tokenForUsers = users.observe {  (changes: RealmCollectionChange) in
            switch changes {
            case .initial(let results):
                print(results)
            case let .update(results, deletions, insertions, modifications):
                observe()
                print(results, deletions, insertions, modifications)
            case .error(let error):
                print(error)
            }
            print("данные изменились")
        }
        return Array(users)
    }
    func saveUsers(users: [UserModel]) throws{
        realm.beginWrite()
        realm.add(users)
        try realm.commitWrite()   
    }
}
