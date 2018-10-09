//
//  LoginController.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation


class UserController: AbstractController {
    
    static let shared = UserController()
    
    // MARK: - Login
    
    func login() {
        log.verbose()
        NotificationCenter.default.post(name: NotificationName.User.connectResult, data: nil)
//        NotificationCenter.default.post(name: NotificationName.User.connectError, data: nil)
    }
    
}
