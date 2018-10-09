//
//  RootViewController.swift
//  GitHub App
//
//  Created by KBL on 03/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    private var current: UIViewController;
    
    init() {
        self.current = SplashViewController();
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Inherit
    
    override func viewDidLoad() {
        super.viewDidLoad();
        addChild(current);
        current.view.frame = view.bounds;
        view.addSubview(current.view);
        current.didMove(toParent: self);
    }
    
    // MARK: - Navigation
    
    func switchToMainScreen() {
        log.verbose()
        let new = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navigation") as! NavigationViewController
        animateFadeTransition(to: new)
    }
    
    func switchToLogout() {
        log.verbose()
        let new = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "login") as! LoginViewController
        animateFadeTransition(to: new)
    }
    
    // MARK: - Private
    
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)
        
        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {
        }) { completed in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
        }
    }
    
    private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        _ = CGRect(x: -view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height)
        current.willMove(toParent: nil)
        addChild(new)
        transition(from: current, to: new, duration: 0.3, options: [], animations: {
            new.view.frame = self.view.bounds
        }) { completed in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
        }
    }
}
