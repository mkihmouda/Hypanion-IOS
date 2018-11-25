//
//  OrderModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit

class OrderModel: Mappable {
    
    var id: Int?
    var laundryId: Int?
    var deliveryId: Int?
    var userId: Int?
    var status: Int?
    var amount: Int?
    var notes: String?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        id                      <- map["id"]
        laundryId               <- map["laundry_id"]
        deliveryId              <- map["delivery_id"]
        userId                  <- map["userId"]
        status                  <- map["status"]
        amount                  <- map["amount"]
        notes                   <- map["notes"]
        createdAt               <- map["created_at"]
        updatedAt               <- map["updated_at"]
        deletedAt               <- map["deleted_at"]
        
    }
}
class ItemModel: Mappable {
    
    var id: Int?
    var companyId: Int?
    var name: String?
    var sku: String?
    var description: String?
    var salePrice: Int?
    var purchasePrice: Int?
    var quantity: String?
    var categoryId: String?
    var taxId: Int?
    var enabled: Int?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        id                      <- map["id"]
        companyId               <- map["company_id"]
        name                    <- map["name"]
        sku                     <- map["sku"]
        description             <- map["description"]
        salePrice               <- map["sale_price"]
        purchasePrice           <- map["purchase_price"]
        quantity                <- map["quantity"]
        categoryId              <- map["category_id"]
        taxId                   <- map["tax_id"]
        enabled                 <- map["enabled"]
        createdAt               <- map["created_at"]
        updatedAt               <- map["updated_at"]
        deletedAt               <- map["deleted_at"]
        
    }
}
