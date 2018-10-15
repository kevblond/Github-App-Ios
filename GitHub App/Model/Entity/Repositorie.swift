//
//  CellRepositorie.swift
//  GitHub App
//
//  Created by KBL on 09/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation

class Repositorie: AbstractEntity {
    var name: String? = nil
    var path: String? = nil
    var numberView: Int? = nil
    var language: String? = nil
    
    init(name: String, path: String, numberView: Int, language: String) {
        self.name = name
        self.path = path
        self.numberView = numberView
        self.language = language
    }
}
