//
//  OrdersModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class OrdersModel: Mappable {
    
    var status: Int?
    var data: [OrderModel]?
    var errors: [ErrorModel]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        status           <- map["status"]
        data             <- map["data"]
        errors           <- map["errors"]
        
    }
}
