//
//  LoginController.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation


class RepositorieController: AbstractController {
    
    static let shared = RepositorieController()
    
    // MARK: - Repositorie
    
    func retrieveRepositories() {
        log.verbose()
        NotificationCenter.default.post(name: NotificationName.Repositorie.loadResult, data: ["CellCont1", "CellCont2", "CellCont3", "CellCont4", "CellCont5"])
    }
}
