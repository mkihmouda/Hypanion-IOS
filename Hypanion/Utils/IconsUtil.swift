//
//  IconsUtil.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class IconsUtil: NSObject {
    
    class func iconAttrs(_ icon: SystemIcons) ->  (width: CGFloat, height: CGFloat, needsRTLFilp: Bool) {
        
        var attrs : (width: CGFloat, height: CGFloat, needsRTLFilp: Bool) = (20,20, false)
        
        switch icon {

        case .SPLASH_BACKGROUND:
            attrs = (screenSize.width, screenSize.height, false)
        case .SPLASH_LOGO:
            attrs = (screenSize.width, 40, false)
        case .MOBILE_ICON:
            attrs = (95, 120, false)
        case .MOBILE_NUM_ICON:
            attrs = (22, 25, false)
        case .PALESTINE_FLAG_ICON:
            attrs = (23, 17, false)
        }
        
        return attrs
    }
    
    // returns an UIImageView with the icon embeded inside and constrains
    class func iconNamed(_ name: SystemIcons) -> UIImageView {
        
        let attrs = iconAttrs(name)
        
        return IconsUtil.iconNamed(name.rawValue, width: attrs.width, height: attrs.height, needsRTLFlip: attrs.needsRTLFilp)
    }
    
    // on return UIImage
    class func imageFor(_ name: SystemIcons) -> UIImage? {
        
        let attrs = iconAttrs(name)
        
        return imageFor(name.rawValue, needsRTLFlip: attrs.needsRTLFilp)
    }
    
    fileprivate class func iconNamed(_ name: String, width: CGFloat, height: CGFloat, needsRTLFlip: Bool) -> UIImageView {
        
        let icon = UIImageView()
        
        icon.image = imageFor(name, needsRTLFlip: needsRTLFlip)
        
        icon.snp.makeConstraints { make in
            
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        icon.contentMode = .scaleAspectFit
        
        return icon
    }
    
    fileprivate class func imageFor(_ name: String, needsRTLFlip: Bool) -> UIImage? {
        
        let image = UIImage(named: name)
        
        if needsRTLFlip && isRTL {
            
            return image?.imageFlippedForRightToLeftLayoutDirection()
        }
        return image
    }
    
}
