//
//  Response.swift
//  Vk_api
//
//  Created by Valentin Mironov on 10.07.2021.
//

import Foundation
import DynamicJSON
protocol Response {
    init?(json: JSON)
}
