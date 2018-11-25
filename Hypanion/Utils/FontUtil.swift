//
//  FontUtil.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit

class FontManager {
    
    // initializes concurrentQueue as a concurrent queue
    fileprivate let concurrentQueue = DispatchQueue(
        label: "yamsafer.FontManager.concurrentQueue", attributes: DispatchQueue.Attributes.concurrent)
    
    private var _fontDict: [String:UIFont]  = [:]
    
    var fontDict: [String:UIFont] {
        var fontDictCopy: [String:UIFont] = [:]
        concurrentQueue.sync {
            fontDictCopy = self._fontDict
        }
        return fontDictCopy
    }
    
    static let sharedInstance =  FontManager()
    
    func addFont(key: String, font: UIFont){
        
        concurrentQueue.async(flags: .barrier) {
            
            self._fontDict.update(key, value: font)
            
        }
    }
    
    private init() {
        
    }
}

class FontUtil {
    
    /**
     Get font from device defaults with specific size and color
     */
    class func getFontWithSize(_ size : CGFloat , name : UIDeviceFonts, lang: DeviceLanguages? = nil, fixRTL: Bool = true) -> UIFont {
        
        let lang = lang ?? UserDefaultUtil.getDeviceLanguage()
        
        var size = size
        
        if isRTL && fixRTL {
            
            size -= 2
        }
        
        let key = size.description + name.rawValue + lang.rawValue
        
        if let font = FontManager.sharedInstance.fontDict[key] {
            
            return font
        }
        
        let font = UIFont(name: getFontName(name, lang: lang) , size: size) ?? UIFont()
        
        FontManager.sharedInstance.addFont(key: key, font: font)
        
        return font
    }
    
    /**
     Get font name from font type
     */
    fileprivate class func getFontName(_ type : UIDeviceFonts, lang:DeviceLanguages? = UserDefaultUtil.getDeviceLanguage()) -> String {
        
        if lang == .ARABIC {
            
            return getArabicFont(type)
        } else {
            
            return getEnglishFont(type)
        }
    }
    
    class fileprivate func getArabicFont(_ type:UIDeviceFonts) -> String {
        
        switch type {
        case .light:
            return "FrutigerLTArabic-45Light"
        case .book:
            return "FrutigerLTArabic-65Bold"
        case .heavy:
            return "FrutigerLTArabic-75Black"
        case .medium:
            return "FrutigerLTArabic-65Bold"
        case .roman:
            return "FrutigerLTArabic-55Roman"
        case .black:
            return "FrutigerLTArabic-75Black"
        case .oblique:
            return "FrutigerLTArabic-75Black"
        }
    }
    
    class fileprivate func getEnglishFont(_ type:UIDeviceFonts) -> String {
        
        switch type {
        case .light:
            return "Avenir-Light"
        case .book:
            return "Avenir-Book"
        case .heavy:
            return "Avenir-Heavy"
        case .medium:
            return "Avenir-Medium"
        case .roman:
            return "Avenir-Roman"
        case .black:
            return "Avenir-Black"
        case .oblique:
            return "Avenir-BlackOblique"
        }
    }
}

extension Dictionary where Key: ExpressibleByStringLiteral, Value:Any {
    
    /**
     *  add a non null value to the dictionary
     */
    mutating func update(_ key: Key, value : Value?){
        
        if let value = value {
            
            self[key] = value
        }
    }
    
    func toData() -> Data? {
        
        let data = (try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted))
        
        return  data
        
    }
}
