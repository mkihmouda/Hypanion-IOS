//
//  LaundriesModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class LaundryModel: Mappable {
    
    var id: Int?
    var domain: String?
    var type: String?
    var cityId: Int?
    var companyName: String?
    var companyAddress: String?
    var companyPhone: String?
    var enabled: Int?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    var city: CityModel?
    var items: [ItemModel]?

    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        id                          <- map["id"]
        domain                      <- map["domain"]
        type                        <- map["type"]
        cityId                      <- map["city_id"]
        companyName                 <- map["company_name"]
        companyAddress              <- map["company_address"]
        companyPhone                <- map["company_phone"]
        enabled                     <- map["enabled"]
        createdAt                   <- map["created_at"]
        deletedAt                   <- map["deleted_at"]
        city                        <- map["city"]
        items                       <- map["items"]

    }
}
