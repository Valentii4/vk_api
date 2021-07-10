//
//  FriendsViewModel.swift
//  Vk_api
//
//  Created by Valentin Mironov on 10.07.2021.
//

import Foundation
protocol FriendsViewModel {
    
}

class FriendsViewModelImpl: FriendsViewModel {
    init() {
        let userID = Session.share.userId
        let token = Session.share.token
        let api = FriendsApiServiceImpl()
        api.getFriends(params: FriendsRequest(userId: userID, count: 10, token: token)) { user, eror in
            
        }
    }
}
