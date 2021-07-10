//
//  UserModel.swift
//  Vk_api
//
//  Created by Valentin Mironov on 10.07.2021.
//

import Foundation
import DynamicJSON

struct UserModel: Response {
    let id: String
    let lastName: String
    let firstName: String
    let photoURL: URL
    
    init?(json: JSON) {
        guard let id = json.id.string,
              let lastName = json.last_name.string,
              let firstName = json.first_name.string,
              let photo100 = json.photo_100.string,
              let photoURL = URL(string: photo100) else {
            return nil
        }
        self.id = id
        self.lastName = lastName
        self.firstName = firstName
        self.photoURL = photoURL
    }
}
