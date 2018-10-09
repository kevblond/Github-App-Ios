//
//  ViewController.swift
//  GitHub App
//
//  Created by KBL on 24/09/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBAction func searchButton() {
        let search = searchBar.text;
        print(search!)
    }
    
}

