//
//  Constant.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation

struct URLApp {
    static let baseURL = "https://api.github.com"
    struct Route {
        static let User = "/users/%@"
        static let Repositories = "/users/%@/repos"
    }
}

struct NotificationName {
    
    struct User {
        static let connectResult: String = "ConnectResult"
        static let connectError: String = "ConnectError"
        static let loadImage: String = "LoadImage"
    }
    
    struct Repositorie {
        static let loadResult: String = "LoadResult"
    }
}
