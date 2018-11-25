//
//  DiscountModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit

class DiscountModel: Mappable{
    
    var id: Int?
    var name: String?
    var description: String?
    var percent: Int?
    var notes: String?
    var enabled: Int?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        id                      <- map["id"]
        name                    <- map["name"]
        notes                   <- map["notes"]
        description             <- map["description"]
        percent                 <- map["percent"]
        enabled                 <- map["enabled"]
        createdAt               <- map["created_at"]
        updatedAt               <- map["updated_at"]
        deletedAt               <- map["deleted_at"]
        
    }
}
