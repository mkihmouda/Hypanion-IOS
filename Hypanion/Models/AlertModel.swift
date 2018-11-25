//
//  AlertModel.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import ObjectMapper

class AlertModel: Mappable {
    
    var code: Int?
    
    var message: String?
    
    var metadata: Any?
    
    var alertMetadata: [AlertMetadataModel]?
    
    var title: String?
    
    var short: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        code                            <- map["code"]
        message                         <- map["message"]
        metadata                        <- map["metadata"]
        alertMetadata                   <- map["metadata"]
        title                           <- map["title"]
        short                           <- map["short"]
        
    }
}
