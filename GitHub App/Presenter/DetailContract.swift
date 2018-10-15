//
//  DetailViewContract.swift
//  GitHub App
//
//  Created by KBL on 15/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

protocol DetailPresenterContract: AbstractPresenterContract {
    func loadImage(url: String)
}

protocol DetailViewContract: AbstractViewContract {
    func resultImage(image: UIImage)
}
