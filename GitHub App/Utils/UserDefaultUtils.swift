//
//  UserDefaultUtils.swift
//  GitHub App
//
//  Created by KBL on 15/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation

class UserDefaultUtils {
    static func setUser(toLog: Bool, name: String, avatarUrl: String) {
        UserDefaults.standard.set(toLog, forKey: "LOGGED_IN")
        UserDefaults.standard.set(name, forKey: "USER_NAME")
        UserDefaults.standard.set(avatarUrl ,forKey: "AVATAR_URL")
    }
    
    static func getUser() -> User {
        return User(login: UserDefaults.standard.string(forKey: "USER_NAME")!, avatar_url: UserDefaults.standard.string(forKey: "AVATAR_URL")!)
    }
}
