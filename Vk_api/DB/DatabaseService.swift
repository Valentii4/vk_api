//
//  DBService.swift
//  Vk_api
//
//  Created by Valentin Mironov on 11.07.2021.
//

import Foundation
protocol DatabaseService {
    func saveUser(user: UserModel) throws
    func saveUsers(users: [UserModel]) throws
    func getUsers() -> [UserModel]
}
