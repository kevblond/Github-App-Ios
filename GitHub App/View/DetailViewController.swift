//
//  DetailViewController.swift
//  GitHub App
//
//  Created by KBL on 01/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionRepositorie: UILabel!
    @IBOutlet weak var avatarUser: UIImageView!
    
    var descriptionRep = String();
    var nameRepositorie = String();
    
    // MARK: - Inherit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionRepositorie.text = descriptionRep;
        self.navigationItem.title = nameRepositorie;
    }
}
