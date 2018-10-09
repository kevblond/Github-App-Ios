//
//  LoginController.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation


class RepositoriesController: AbstractController {
    
    static let shared = RepositoriesController()
    
    private override init() {}
    
    func loadRepositories() {
        log.verbose()
        //name path numberView language
        NotificationCenter.default.post(name: NotificationName.User.connectResult, data: [CellRepositorie(name: "CellLoad", path: "CellLoadPath", numberView: 46, language: "CellLoadLanguage"), CellRepositorie(name: "CellLoad", path: "CellLoadPath", numberView: 46, language: "CellLoadLanguage")])
    }
    
}
