//
//  LoadingViewController.swift
//  GitHub App
//
//  Created by KBL on 15/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        log.verbose()
        super.viewWillAppear(animated)
        self.activityIndicator.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        log.verbose()
        super.viewDidDisappear(animated)
        self.activityIndicator.stopAnimating()
    }
}
