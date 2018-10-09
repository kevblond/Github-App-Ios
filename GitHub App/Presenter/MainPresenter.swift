//
//  LoginPresenter.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class MainPresenter: AbstractPresenter<MainViewContract> {
    
    var currentUser = String()
    
    // MARK: - Inherit
    
    override func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(MainPresenter.restituteCells(_:)), name: NotificationName.Repositorie.loadResult)
    }
    
    // MARK: - Observer
    
    @objc func restituteCells(_ notif: Notification) {
        log.verbose(notif.object)
        
        self.delegate?.restituteRepositories(user: "kev", repositories: notif.object as! [String])
        //        self.delegate?.displayError("test")
    }
}

extension MainPresenter: MainPresenterContract {
    
    func getRepositories() {
        log.verbose()
        RepositorieController.shared.retrieveRepositories()
    }
}
