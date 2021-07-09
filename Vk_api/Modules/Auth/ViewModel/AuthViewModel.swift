//
//  AuthViewModel.swift
//  Vk_api
//
//  Created by Valentin Mironov on 06.07.2021.
//

import Foundation
protocol AuthViewModel {
    var urlRequest: URLRequest? { get }
    var redirectPath: String { get }
    func saveTokenAndUserId(_ fromURL: URL?) throws
}

class AuthViewModelImpl: AuthViewModel {
    private var clientId: String  = "7896976"
    private var responseType: String = "token"
    private var hostUrlComponents: URLComponents? = URLComponents(string:"https://oauth.vk.com")
    
    var redirectPath: String {
        return "/blank.html"
    }
    
    var urlRequest: URLRequest? {
        get {
            var urlComponents = hostUrlComponents ?? URLComponents()
                    urlComponents.path = "/authorize"
                    urlComponents.queryItems = [
                        URLQueryItem(name: "client_id", value: clientId),
                        URLQueryItem(name: "display", value: "mobile"),
                        URLQueryItem(name: "redirect_uri", value: urlComponents.url?.relativeString ?? "" + redirectPath),
                        URLQueryItem(name: "scope", value: "270342"),
                        URLQueryItem(name: "response_type", value: responseType),
                        URLQueryItem(name: "revoke", value: "1")
                    ]
            guard  let url =  urlComponents.url else {
                print("URL equal nil in AuthViewModelImpl: urlComponents")
                return nil
            }
            return URLRequest(url: url)
        }
    }
    
    func saveTokenAndUserId(_ fromURL: URL?) throws {        
        guard let url = fromURL,
              url.path == redirectPath,
              let fragment = url.fragment  else {
            throw DefaultErrors.urlNotValidate
        }
        
        let params = getParamsFromFragment(fragment)
        
        if let token = params["access_token"],
           let userID = params["user_id"]{
            Session.share.token = token
            Session.share.userId = userID
        }
    }
    
    private func getParamsFromFragment(_ fragment: String) -> [String: String]{
        return  fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
    }
    
}
