//
//  DeviceModel.swift
//  Hypanion
//
//  Created by hadeel on 11/5/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class DeviceModel: Mappable {
    
    var deviceId: String?
    var deviceName: String?
    var os: String?
    var deviceToken: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        deviceId                    <- map["deviceId"]
        deviceName                  <- map["deviceName"]
        os                          <- map["os"]
        deviceToken                 <- map["deviceToken"]

    }
}
