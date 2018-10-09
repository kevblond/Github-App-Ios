//
//  LoginContract.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

protocol MainPresenterContract: AbstractPresenterContract {
    func getRepositories()
}

protocol MainViewContract: AbstractViewContract {
    func restituteRepositories(user: String, repositories: [String])
}
