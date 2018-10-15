//
//  DetailViewPresenter.swift
//  GitHub App
//
//  Created by KBL on 15/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class DetailPresenter: AbstractPresenter<DetailViewContract> {
    
    var image: UIImage?
    
    override func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(DetailPresenter.restituteImage(_:)), name: NotificationName.User.loadImage)
    }
    
    @objc func restituteImage(_ notification: Notification) {
        image = notification.object as? UIImage
        self.delegate?.resultImage(image: image!)
    }
}


extension DetailPresenter: DetailPresenterContract {
    func loadImage(url: String) {
        UserController.shared.loadImage(url: url)
    }
}
