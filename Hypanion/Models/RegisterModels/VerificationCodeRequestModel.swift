//
//  VerificationCodeRequestModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class VerificationCodeRequestModel: Mappable {
    
    var countryCode: String?
    var mobile: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        countryCode           <- map["countryCode"]
        mobile                <- map["mobile"]
    }
}
