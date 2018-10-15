//
//  LoginPresenter.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class LoginPresenter: AbstractPresenter<LoginViewContract> {
    
    var currentUser = UserVO()
    
    // MARK: - Inherit
    
    override func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(LoginPresenter.connectResult(_:)), name: NotificationName.User.connectResult)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginPresenter.displayError(_:)), name: NotificationName.User.connectError)
    }
    
    // MARK: - Observer
    
    @objc func connectResult(_ notif: Notification) {
        log.verbose()
        self.delegate?.resultLogin()
    }
    
    @objc func displayError(_ notif: Notification) {
        log.verbose()
        self.delegate?.displayError("test")
    }
}

extension LoginPresenter: LoginPresenterContract {
    
    func login(_ user: String) {
        log.verbose()
        UserController.shared.login(user: user)
    }
}
