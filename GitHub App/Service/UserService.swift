//
//  LoginService.swift
//  GitHub App
//
//  Created by KBL on 11/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class UserService: NSObject {
    static func searchUser(_ user: String, completionHandler: @escaping ((_ res:Result<User>) -> Void)) {
        log.verbose()
        let decoder = JSONDecoder()
        let url = URLApp.baseURL+String(format: URLApp.Route.User, user)
        Alamofire.request(url, method:.get)
            .responseDecodableObject(keyPath: nil, decoder: decoder) { (responseObject: DataResponse<User>) in
            if responseObject.result.isSuccess {
                completionHandler(responseObject.result)
            }else {
                log.error()
            }
        }
    }
    
    static func loadImage(_ url: String, completionHandler: @escaping ((_ res:Result<UIImage>) -> Void)) {
        log.verbose()
        Alamofire.request(url).responseImage { response in
            log.debug(response)
            if let image = response.result.value {
                log.debug(image)
                completionHandler(response.result)
            }
        }
    }
}
