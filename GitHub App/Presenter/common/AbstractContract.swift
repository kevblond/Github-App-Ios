//
//  AbstractContract.swift
//  GitHub App
//
//  Created by KBL on 08/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

protocol AbstractPresenterContract: class {
    
}

protocol AbstractViewContract: class {
    func displayError(_ error: String)
}

protocol AbstractTableViewContract: class {
    func displayError(_ error: String)
}
