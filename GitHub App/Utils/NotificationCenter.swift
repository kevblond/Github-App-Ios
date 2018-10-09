//
//  NotificationCenter+Utils.swift
//  jaab
//
//  Created by SSE on 23/08/2018.
//  Copyright © 2018 Docapost. All rights reserved.
//

import Foundation

extension NotificationCenter {
    
    func post(name: String, data: Any?) {
        let completion: (() -> Void) = {
            [unowned self] () -> Void in
            self.post(name: Notification.Name(rawValue: name), object: data, userInfo: nil)
        }
        
        if !Thread.isMainThread {
            DispatchQueue.main.sync {
                completion()
            }
        } else {
            completion()
        }
    }
    
    func addObserver(_ observer: Any, selector: Selector, name: String) {
        self.addObserver(observer, selector: selector, name: Notification.Name(rawValue: name), object: nil)
    }
    
    func addObserver(_ observer: Any, name: String, closure: @escaping (Notification) -> Void) -> NSObjectProtocol {
        // this can be used if we only add observer on the default observer
        return self.addObserver(forName: Notification.Name(rawValue: name), object: nil, queue: nil, using: closure)
    }
    
    func removeObserver(_ observer: Any, name: String) {
        self.removeObserver(observer, name: NSNotification.Name(rawValue: name), object: nil)
    }
}
