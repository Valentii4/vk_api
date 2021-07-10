//
//  FriendViewModel.swift
//  Vk_api
//
//  Created by Valentin Mironov on 10.07.2021.
//

import Foundation
import UIKit
import Kingfisher

protocol FriendViewModel{
    var imageURL: URL { get }
    var firstName: String { get }
    var secondName: String { get }
}

class FriendViewModelImpl: FriendViewModel {
    private let user: UserModel
    init(user: UserModel){
        self.user = user
    }
    
    var imageURL: URL{
        user.photoURL
    }
    var firstName: String {
        user.firstName
    }
    var secondName: String {
        user.lastName
    }
    
    
    
    
}
