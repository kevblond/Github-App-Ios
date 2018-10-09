//
//  LoginContract.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

protocol LoginPresenterContract: AbstractPresenterContract {
    func login(_ user: String)
}

protocol LoginViewContract: AbstractViewContract {
    func resultLogin()
}
