//
//  FriendsApiService.swift
//  Vk_api
//
//  Created by Valentin Mironov on 09.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON

protocol FriendsApiService {
    func getFriends(params: FriendsRequest, completion:  @escaping ([UserModel], Error?) -> ())
}

final class FriendsApiServiceImpl: FriendsApiService {
    private let baseURL = DefaultURL.baseURL
    private let method = "/friends.get"
    private let version = "5.21"
    
    func getFriends(params: FriendsRequest, completion: @escaping ([UserModel], Error?) -> ()){
        guard let url = URL(string: baseURL+method) else{
            return
        }
        AF.request(url, method: .get, parameters: params.params).responseData { response in
            guard let data = response.data else{
                return
            }
            
            guard let items = JSON(data).response.items.array else {return}
            var users: [UserModel] = []
            items.forEach{
                if let user = UserModel(json: $0){
                    users.append(user)
                }
            }
            completion(users,nil)
        }
    }
    
}



