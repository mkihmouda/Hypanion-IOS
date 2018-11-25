//
//  RequestUtil.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation

// request default static values
struct RequestDefaultValues {
    
    static let HTTPS_PART                               = "http://"
    static let API_PATH                                 = "switchhivestaging.westus.cloudapp.azure.com"
    static let HYPAINION_URL                             = "/hypanion/api"
}

//Add system service URL static path strings
struct SystemServiceUrls {
    
    // Authentication
    static let REGISTER                     = "/register"
    static let REGISTER_VERIFY              = "/register/verify"
    static let GET_VERIFICATION_CODE        = "/register/code/request"
    static let GET_TOKEN                    = "/login/token/refresh"
    // Device info
    static let UPDATE_PROFILE               = "/user/updateProfile"
    static let UPDATE_DEVICE_INFO           = "/api/device/add"
    static let UPDATE_PUSH_TOKEN            = "/device/update/pn-token"
    // List of Laundries, Cities and Discount
    static let GET_LIST_LAUNDRIES           = "/laundry/list"
    static let GET_LIST_CITIES              = "/city/list"
    static let GET_LIST_DISCOUNT            = "/discount/list"
    // Order
    static let GET_LIST_ORDERS              = "/order/list"
    static let ORDER_CHECKOUT               = "/order/checkout"
    
}

class RequestUtil: NSObject {
    
    /**
     Class function to return system service url strings
     */
    class func getServiceUrlString(_ service : SystemService, withParam param: [CVarArg]? = nil , lang : DeviceLanguages = UserDefaultUtil.getDeviceLanguage()) -> String {
        
        let param  = param ?? [""]
        
        //get system base url
        var baseSystemUrlString = getSystemBaseURL()
        
        //switch on services enum value
        switch service {
            
        case .register:
            
            baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.REGISTER)"
        
            break
            
        case .registerVerify:
            
              baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.REGISTER_VERIFY)"
       
            break
            
        case .getVerificationCode:
            
            baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.GET_VERIFICATION_CODE)"
            
            break
            
        case .getToken:
            
              baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.GET_TOKEN)"
         
            break

        case .updateProfile:
            
            baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.UPDATE_PROFILE)"
            
            break

        case .updateDeviceInfo:
            
              baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.UPDATE_DEVICE_INFO)"
      
            break

        case .updatePushToken:
            
            baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.UPDATE_PUSH_TOKEN)"
            
            break

        case .getLaundariesList:
            
            baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.GET_LIST_LAUNDRIES)"
            
            break

        case .getCitieslist:
            
            baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.GET_LIST_CITIES)"
            
            break

        case .getDiscountList:
            
            baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.GET_LIST_DISCOUNT)"
            
            break

        case .getOrdersList:
            
            baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.GET_LIST_ORDERS)"
            
            break

        case .checkoutOrder:
            
            baseSystemUrlString = "\(baseSystemUrlString)\(SystemServiceUrls.ORDER_CHECKOUT)"
            
            break
        }
     
        return baseSystemUrlString
    }
    
    /**
     System Base url, return the service apis base url
     */
    fileprivate class func getSystemBaseURL(_ isVersionThree: Bool = false) -> String {

        return RequestDefaultValues.HTTPS_PART + RequestDefaultValues.API_PATH + RequestDefaultValues.HYPAINION_URL
    }
}
