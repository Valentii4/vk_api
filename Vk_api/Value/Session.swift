//
//  Session.swift
//  Vk_api
//
//  Created by Valentin Mironov on 28.06.2021.
//

import Foundation
///TODO: - как лучше назвать папку где будет храниться Session?
final class Session{
    static let share = Session()
    private init(){
        
    }
    
    var token: String?
    var userId: Int?
}
