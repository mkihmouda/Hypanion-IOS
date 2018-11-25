//
//  OrderCheckoutRequestUtil.swift
//  Hypanion
//
//  Created by hadeel on 11/6/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class OrderCheckoutRequestModel: Mappable {
    
    var laundries: OrdersRequestModel?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        laundries        <- map["laundries"]
        
    }
}

class OrdersRequestModel: Mappable {
    
    var orders: [ItemsRequestModel]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        orders        <- map["orders"]
    }
    
}

class ItemsRequestModel: Mappable {
    
    var items: [ItemModel]?
    var orderStatus: Int?

    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        items              <- map["orders"]
        orderStatus        <- map["order_status"]

    }
    
}
