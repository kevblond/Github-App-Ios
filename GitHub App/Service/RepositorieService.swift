//
//  RepositorieService.swift
//  GitHub App
//
//  Created by KBL on 11/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import Foundation
import Alamofire

class RepositorieService: NSObject {
    static func getRepositories(_ user: String, completionHandler: @escaping ((_ res:Result<[Repositorie]>) -> Void)) {
        log.verbose()
        let decoder = JSONDecoder()
        let url = URLApp.baseURL + String(format: URLApp.Route.Repositories, user)
        Alamofire.request(url, method:.get).responseDecodableObject(keyPath:nil, decoder: decoder){ (responseObject: DataResponse<[Repositorie]>) in
            if responseObject.result.isSuccess {
                completionHandler(responseObject.result)
            } else {
                log.error(responseObject)
            }
        }
    }
}
