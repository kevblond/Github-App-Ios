//
//  MainViewCell.swift
//  GitHub App
//
//  Created by KBL on 01/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class RepositorieCell: UITableViewCell {

    @IBOutlet weak var nameRepositorie: UILabel!
    @IBOutlet weak var pathRepositorie: UILabel!
    @IBOutlet weak var numberViewerRepositorie: UILabel!
    @IBOutlet weak var languageRepositorie: UILabel!
    
    // MARK: - Inherit
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Initialization
    
    func setCell(name: String, path: String, numberView: String, language: String) {
        self.nameRepositorie.text = name;
        self.pathRepositorie.text = path;
        self.numberViewerRepositorie.text = numberView;
        self.languageRepositorie.text = language;
    }

}
