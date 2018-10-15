//
//  UserConverter.swift
//  GitHub App
//
//  Created by KBL on 10/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation

class UserConverter {
    static func entityToVo(_ entity: User) -> UserVO {
        var userVO = UserVO()
        userVO.name = entity.login
        userVO.avatarName = entity.avatar_url
        return userVO
    }
}
