//
//  CitiesModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class CitiesModel: Mappable {
    
    var status: Int?
    var data: [CityModel]?
    var errors: [ErrorModel]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        status           <- map["status"]
        data             <- map["data"]
        errors           <- map["errors"]
        
    }
}

class CityModel: Mappable{
   
    var id: Int?
    var country_id: Int?
    var createdAt: String?
    var label: String?
    var updatedAt: String?
    var deletedAt: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        id                      <- map["id"]
        country_id              <- map["country_id"]
        createdAt               <- map["created_at"]
        label                   <- map["label"]
        updatedAt               <- map["updated_at"]
        deletedAt               <- map["deleted_at"]

    }
}
