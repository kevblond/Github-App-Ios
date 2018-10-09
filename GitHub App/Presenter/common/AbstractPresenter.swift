//
//  AbstractPresenter.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation

class AbstractPresenter<T>: NSObject {
    private weak var _delegate: AnyObject?
    
    var delegate: T? {
        get {
            return _delegate as? T
        }
        set {
            _delegate = newValue as AnyObject?
        }
    }
    
    init(delegate: T) {
        super.init()
        self.delegate = delegate
        self.registerNotification()
    }
    
    func registerNotification() {}
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
