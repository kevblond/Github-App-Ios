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
    
    private override init() {}
    
    func login() {
        log.verbose()
        NotificationCenter.default.post(name: NotificationName.User.connectResult, data: nil)
    }
    
}
