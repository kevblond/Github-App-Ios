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
            (res :Result<User>) in
            if(res.value?.login != nil) {
                UserDefaultUtils.setUser(toLog: true, name: (res.value?.login)!, avatarUrl: (res.value?.avatar_url)!)
                NotificationCenter.default.post(name: NotificationName.User.connectResult, data: nil)
                
            }
        })
    }
    
    func getUser() -> User {
//todo        userDAO.getUser
        let user = UserDefaultUtils.getUser()
//        let userMock = User(login:"kevblond", avatar_url:"https://avatars1.githubusercontent.com/u/15784992?v=4")
        return user
    }
    
    func loadImage(url: String) {
        UserService.loadImage(url, completionHandler: {
            (res :Result<UIImage>) in
            NotificationCenter.default.post(name: NotificationName.User.loadImage, data: res.value)
        })
    }
}
