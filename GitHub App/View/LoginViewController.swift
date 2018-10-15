//
//  LoginViewController.swift
//  GitHub App
//
//  Created by KBL on 01/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var presenter: LoginPresenterContract?
    
    @IBOutlet weak var searchBar: UITextField!
    
    // MARK: - Inherit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login Screen";
        self.presenter = LoginPresenter(delegate: self)
    }
    
    // MARK: - Action
    
    @IBAction func didFindUser() {
        log.verbose()
        presenter?.login(searchBar.text!)
    }
    
    private func userFound() {
        log.verbose()
        AppDelegate.shared.rootViewController.switchToMainScreen()
    }
}

extension LoginViewController: LoginViewContract {
    func displayError(_ error: String) {
//        self.displayLoader(false)
        print(error)
    }
    
    func resultLogin() {
        log.verbose()
        userFound()
    }
}
