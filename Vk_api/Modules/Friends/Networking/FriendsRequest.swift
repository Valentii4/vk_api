//
//  FriendsRequest.swift
//  Vk_api
//
//  Created by Valentin Mironov on 09.07.2021.
//

import Foundation
struct FriendsRequest: Request {
    var params: [String : Any] {
        return ["user_id": userId,
                "order":order,
                "fields":fields,
                "v":version,
                "count":count,
                "access_token": token]
    }
    
    private let order = "name"
    private let fields = "photo_100"
    private let version = "5.21"
    let userId: String
    let count: Int
    let token: String
    
}
