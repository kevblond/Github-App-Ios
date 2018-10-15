//
//  CellRepositorie.swift
//  GitHub App
//
//  Created by KBL on 09/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation

struct Repositorie: Decodable {
    
    let name: String
    let full_name: String
    let watchers_count: Int
    let language: String?
    let descriptionRep: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case full_name
        case watchers_count
        case language
        case descriptionRep = "description"
    }
}
