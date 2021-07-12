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
    
    func getUsers() -> [UserModel]{
        let users = realm.objects(UserModel.self)
        return Array(users)
    }
    func saveUsers(users: [UserModel]) throws{
        realm.beginWrite()
        users.forEach{
            realm.add($0)
        }
        try realm.commitWrite()   
    }
}
