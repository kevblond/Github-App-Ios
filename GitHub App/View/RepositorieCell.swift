//
//  MainViewCell.swift
//  GitHub App
//
//  Created by KBL on 01/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class RepositorieCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var langage: UILabel!
    @IBOutlet weak var numberView: UILabel!
    
    private var isLoaded: Bool = false

    var repository: RepositorieVO? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Inherit
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        isLoaded = true
        updateView()
    }

    private func updateView() {
        if isLoaded {
            if let repository = repository {
                self.name.text = repository.name
                self.fullName.text = repository.path
                self.numberView.text = String(repository.numberView)
                self.langage.text = repository.langage
            } else {
                self.name.text = nil
                self.fullName.text = nil
                self.numberView.text = nil
                self.langage.text = nil
            }
        }
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    // MARK: - Initialization
}
