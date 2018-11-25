//
//  AccessTokenModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit

class AccessTokenModel: Mappable {
    
    var userId: Int?
    var clinentId: Int?
    var clientSecret: String?
    var refreshToken: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        userId                  <- map["userId"]
        clinentId               <- map["clinentId"]
        clientSecret            <- map["clientSecret"]
        refreshToken            <- map["refreshToken"]
        
    }
}
