//
//  RegisterVerifyResponseModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class RegisterVerifyResponseModel: Mappable {

    var status: String?
    var data: [UserModel]?
    var errors: [ErrorModel]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        status           <- map["status"]
        data             <- map["data"]
        errors           <- map["errors"]
        
    }
}

class UserModel: Mappable {
    
    var userId: Int?
    var clinentId: Int?
    var clientSecret: String?
    var accessToken: String?
    var refreshToken: String?
    var tokenType: String?
    var expiresIn: Int?
    var profile: ProfileModel?
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        userId                  <- map["userId"]
        clinentId               <- map["clinentId"]
        clientSecret            <- map["clientSecret"]
        accessToken             <- map["accessToken"]
        refreshToken            <- map["refreshToken"]
        tokenType               <- map["tokenType"]
        expiresIn               <- map["expiresIn"]
        profile                 <- map["profile"]

    }
}
