//
//  ProfileModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class ProfileModel: Mappable {
    
    var name: String?
    var email: String?
    var gender: String?
    var dateOfBirth: String?
    var mobile: String?
    var city: Int?
    var address: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        name                    <- map["name"]
        email                   <- map["email"]
        gender                  <- map["gender"]
        dateOfBirth             <- map["dateOfBirth"]
        mobile                  <- map["mobile"]
        city                    <- map["city"]
        address                 <- map["address"]

    }
}

