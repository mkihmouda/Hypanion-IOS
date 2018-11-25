//
//  AlertMetadataModel.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import ObjectMapper

class AlertMetadataModel: Mappable {
    
    var reason:String?
    var field:String?
    var value:String?
    var message:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        reason                                  <- map["reason"]
        field                                   <- map["field"]
        value                                   <- map["value"]
        message                                 <- map["message"]
    }
}
