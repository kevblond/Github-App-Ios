//
//  LoginController.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation
import Alamofire


class UserController: AbstractController {
    
    static let shared = UserController()
    
    // MARK: - Login
    
    func login(user: String) {
        log.verbose()
        UserService.searchUser ( user, completionHandler: {
            (res :Result<User>?, error: Error?) in
            if(res != nil) {
                UserDefaultUtils.setUser(toLog: true, name: (res?.value?.login)!, avatarUrl: (res?.value?.avatar_url)!)
                NotificationCenter.default.post(name: NotificationName.User.connectResult, data: nil)
            } else {
                NotificationCenter.default.post(name: NotificationName.User.connectError, data: nil)
            }
        })
    }
    
    func getUser() -> User {
        return UserDefaultUtils.getUser()
    }
    
    func loadImage(url: String) {
        UserService.loadImage(url, completionHandler: {
            (res :Result<UIImage>) in
            NotificationCenter.default.post(name: NotificationName.User.loadImage, data: res.value)
        })
    }
}
