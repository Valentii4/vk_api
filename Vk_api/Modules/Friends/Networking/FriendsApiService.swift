//
//  FriendsApiService.swift
//  Vk_api
//
//  Created by Valentin Mironov on 09.07.2021.
//

import Foundation
import Alamofire

protocol FriendsApiService {
    func getFriends(params: FriendsRequest, completion: ([User], Error?) -> ())
}

final class FriendsApiServiceImpl: FriendsApiService {
    private let baseURL = DefaultURL.baseURL
    private let method = "/friends.get"
    private let version = "5.21"
    
    func getFriends(params: FriendsRequest, completion: ([User], Error?) -> ()){
        guard let url = URL(string: baseURL+method) else{
            return
        }
        AF.request(url, method: .get, parameters: params.params).responseData { response in
            guard let responseString = response.data?.prettyJSON else{
                return
            }
            print(responseString)
        }
    }
    
}





struct User {
    
}
