//
//  RegisterRequestModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class RegisterRequestModel: NSObject, Mappable {
    
    var countryCode: String?
    var mobile: String?
    var code: String?

    override init() {
        
    }
    
    init(countryCode: String, mobile: String) {
      
        self.countryCode = countryCode
        self.mobile = mobile
    }
    
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        
        countryCode           <- map["countryCode"]
        mobile                <- map["mobile"]
        code                  <- map["code"]

    }
}
