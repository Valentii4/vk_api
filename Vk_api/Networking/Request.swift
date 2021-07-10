//
//  Request.swift
//  Vk_api
//
//  Created by Valentin Mironov on 09.07.2021.
//

import Foundation
protocol Request{
    var params: [String: Any] { get }
}
