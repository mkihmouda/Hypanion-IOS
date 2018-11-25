//
//  DeviceLanguages.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation

public var isRTL: Bool {
    
    return UserDefaultUtil.getDeviceLanguage() == .ARABIC
}

enum DeviceLanguages:String {
    
    case ARABIC             = "ar"
    case ENGLISH            = "en"
    
    static let languagesList = [ARABIC, ENGLISH]

}
