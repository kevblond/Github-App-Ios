//
//  RepositorieConverter.swift
//  GitHub App
//
//  Created by KBL on 10/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation

class RepositorieConverter {
    static func entityToVo(_ entity: Repositorie) -> RepositorieVO {
        var repositorieVO = RepositorieVO()
        repositorieVO.name = entity.name
        repositorieVO.path = entity.full_name
        repositorieVO.numberView = entity.watchers_count
        repositorieVO.langage = entity.language
        repositorieVO.description = entity.descriptionRep
        return repositorieVO
    }
}
