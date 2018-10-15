//
//  LoginController.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire


class RepositorieController: AbstractController {
    
    static let shared = RepositorieController()
    
    // MARK: - Repositorie
    
    func retrieveRepositories(user: User) {
        log.verbose()
        RepositorieService.getRepositories(user.login, completionHandler: {
            (res: Result<[Repositorie]>) in
                NotificationCenter.default.post(name: NotificationName.Repositorie.loadResult, data: res.value)
        })
    }
}
