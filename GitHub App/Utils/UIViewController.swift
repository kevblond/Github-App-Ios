////
////  UIViewController.swift
////  GitHub App
////
////  Created by KBL on 15/10/2018.
////  Copyright © 2018 KBL. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//extension UIViewController {
//    func displayLoader() {
//        log.verbose()
//        let storyboard = UIStoryboard(name: StoryboardName.Loading, bundle: nil)
//        let viewController: LoadingViewController = storyboard.instantiateInitialViewController()! as! LoadingViewController
//        self.present(viewController, animated: true, completion: nil)
//    }
//
//    func hideLoader(completion:@escaping (() -> Void) = {}) {
//        log.verbose()
//        let loadingViewController: LoadingViewController? = self.getAncestor(ofType: LoadingViewController.self)
//        loadingViewController?.dismiss(animated: true, completion: {
//            completion()
//        })
//    }
//
//    private func getAncestor<T: UIViewController>(ofType type: T.Type) -> T? {
//        var isFound = false
//        var currentViewController: UIViewController? = self
//        while !isFound && currentViewController?.presentedViewController != nil {
//            if (currentViewController?.presentedViewController)!.isKind(of: type) {
//                isFound = true
//            }
//            currentViewController = currentViewController?.presentedViewController
//        }
//
//        if isFound {
//            return currentViewController as! T?
//        } else {
//            return nil
//        }
//    }
//}

import Foundation
import UIKit

extension UIViewController {
    
    func displayLoader(_ isDisplayed: Bool, completion:@escaping (() -> Void) = {}){
        log.verbose()
        // show the LoadingViewController
        if isDisplayed {
            if self.hasAncestor(ofType: LoadingViewController.self){
                log.error("the navigation controller already contains a loader")
            } else {
                let storyboard = UIStoryboard(name: StoryboardName.Loading, bundle: nil)
                let viewController: LoadingViewController = storyboard.instantiateInitialViewController()! as! LoadingViewController
                self.present(viewController, animated: true, completion: nil)
            }
        } else {
            let loadingViewcontroller: LoadingViewController? = self.getAncestor(ofType: LoadingViewController.self)
            loadingViewcontroller?.dismiss(animated: true, completion: {
                completion()
            })
        }
    }
    
    func hasAncestor<T: UIViewController>(ofType type: T.Type) -> Bool {
        let ancestor = getAncestor(ofType: type)
        return ancestor != nil
    }
    
    func getAncestor<T: UIViewController>(ofType type: T.Type) -> T? {
        var isFound = false
        var currentViewController: UIViewController? = self
        while !isFound && currentViewController?.presentedViewController != nil {
            if (currentViewController?.presentedViewController)!.isKind(of: type) {
                isFound = true
            }
            currentViewController = currentViewController?.presentedViewController
        }
        
        if isFound {
            return currentViewController as! T?
        } else {
            return nil
        }
    }
}
