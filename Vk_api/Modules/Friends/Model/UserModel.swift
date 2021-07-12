//
//  UserModel.swift
//  Vk_api
//
//  Created by Valentin Mironov on 10.07.2021.
//

import Foundation
import DynamicJSON
import RealmSwift

class UserModel: Object, Response{
    @objc dynamic var id: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var photoString: String = ""
    @objc dynamic var trackCode: String = ""
    
    override init() {
      
    }
    
    required init?(json: JSON){
        guard let id = json.id.string,
              let lastName = json.last_name.string,
              let firstName = json.first_name.string,
              let photo100 = json.photo_100.string,
              let trackCode = json.track_code.string else {
            print("UserModel not init from JSON")
            return nil
        }
        self.id = id
        self.lastName = lastName
        self.firstName = firstName
        self.photoString = photo100
        self.trackCode = trackCode
        
    }
    
}
