//
//  User.swift
//  GitHub App
//
//  Created by KBL on 10/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation

struct User: Decodable {
    
    let login: String
    let avatar_url: String?
    
    private enum CodingKeys: String, CodingKey {
        case login
        case avatar_url
    }
}
