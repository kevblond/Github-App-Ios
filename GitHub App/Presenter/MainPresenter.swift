//
//  LoginPresenter.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class MainPresenter: AbstractPresenter<MainViewContract> {
    
    var currentUser = UserVO()
    var repositories : [RepositorieVO] = []
    
    // MARK: - Inherit
    
    override func registerNotification() {
        log.verbose()
        NotificationCenter.default.addObserver(self, selector: #selector(MainPresenter.restituteCells(_:)), name: NotificationName.Repositorie.loadResult)
    }
    
    // MARK: - Observer
    
    @objc func restituteCells(_ notif: Notification) {
        log.verbose()
        repositories = (notif.object as! [Repositorie]).map {repo in RepositorieConverter.entityToVo(repo) }
        self.delegate?.restituteRepositories(user: currentUser, repositories: repositories)
    }
}

extension MainPresenter: MainPresenterContract {
    
    func getData() {
        log.verbose()
        let user = UserController.shared.getUser()
        currentUser = UserConverter.entityToVo(user)
        log.debug(currentUser)
        RepositorieController.shared.retrieveRepositories(user: user)
    }
}
