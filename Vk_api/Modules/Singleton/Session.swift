//
//  Session.swift
//  Vk_api
//
//  Created by Valentin Mironov on 28.06.2021.
//

import Foundation
final class Session{
    static let share = Session()
    private init(){
        
    }
    
    var token: String = ""
    var userId: String = ""
}
