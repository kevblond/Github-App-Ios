//
//  DetailViewController.swift
//  GitHub App
//
//  Created by KBL on 01/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionRepositorie: UILabel!
    @IBOutlet weak var avatarUser: UIImageView!
    
    var presenter: DetailPresenterContract?
    
    var user = UserVO()
    var repositorie = RepositorieVO()
    
    // MARK: - Inherit
    
    override func viewDidLoad() {
        log.verbose()
        super.viewDidLoad()
        descriptionRepositorie.text = repositorie.description
        self.navigationItem.title = repositorie.name
        self.presenter = DetailPresenter(delegate:self)
        presenter?.loadImage(url: user.avatarName)
    }
}

extension DetailViewController: DetailViewContract {
    func displayError(_ error: String) {
        log.error(error)
    }
    
    func resultImage(image: UIImage) {
        log.verbose()
        avatarUser.image = image
    }
}
