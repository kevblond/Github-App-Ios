//
//  SplashViewController.swift
//  GitHub App
//
//  Created by KBL on 03/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    private let activityIndic = UIActivityIndicatorView(style: .whiteLarge);
    
    // MARK: - Inherit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeServiceCall()
    }
    
    // MARK: - Private
    
    private func makeServiceCall() {
        activityIndic.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.activityIndic.stopAnimating();
            if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
                AppDelegate.shared.rootViewController.switchToMainScreen()
            } else {
                AppDelegate.shared.rootViewController.switchToLogout()
            }
        }
    }
}
