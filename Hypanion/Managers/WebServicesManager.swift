//
//  WebServicesManager.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class WebServicesManager {
    
    /*
     Get verification code
     */
    class func register(registerRequestModel: RegisterRequestModel, completeHandler: @escaping (_ isSuccess: Bool, _ result : RegisterResponseModel?) -> ()) {
        
         let requestString = RequestUtil.getServiceUrlString(.register, withParam: [])

        let requestBodyData = Mapper<RegisterRequestModel>().toJSONString(registerRequestModel, prettyPrint: true)?.toData()
        
            #if DEBUG
            
            if let requestBodyString = Mapper<RegisterRequestModel>().toJSONString(registerRequestModel, prettyPrint: true) {
                
                print(requestBodyString)
            }
        
            #endif
        
        Loader.loadContentOfUrl(requestString, requestType: .POST, body: requestBodyData, bodyType: .JSON, isAuthenticated: false, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<RegisterResponseModel>().map(JSONString: responseStr))
        })
    }
    
    class func verifyAccount(verifyAccountModel: RegisterRequestModel, completeHandler: @escaping (_ isSuccess: Bool, _ result : RegisterVerifyResponseModel?) -> ()) {
        
        let requestString = RequestUtil.getServiceUrlString(.registerVerify, withParam: [])
        
        let requestBodyData = Mapper<RegisterRequestModel>().toJSONString(verifyAccountModel, prettyPrint: true)?.toData()
        
        #if DEBUG
        
        if let requestBodyString = Mapper<RegisterRequestModel>().toJSONString(verifyAccountModel, prettyPrint: true) {
            
            print(requestBodyString)
        }
       
        #endif

        Loader.loadContentOfUrl(requestString, requestType: .POST, body: requestBodyData, bodyType: .JSON, isAuthenticated: false, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<RegisterVerifyResponseModel>().map(JSONString: responseStr))
        })
        
    }
    
    class func getVerificationCodeFromOtherEndPoint(verifyAgainModel: RegisterRequestModel, completeHandler: @escaping (_ isSuccess: Bool, _ result : RegisterResponseModel?) -> ()){
        
        let requestString = RequestUtil.getServiceUrlString(.getVerificationCode, withParam: [])
        
        let requestBodyData = Mapper<RegisterRequestModel>().toJSONString(verifyAgainModel, prettyPrint: true)?.toData()
        
        #if DEBUG
        
        if let requestBodyString = Mapper<RegisterRequestModel>().toJSONString(verifyAgainModel, prettyPrint: true) {
            
            print(requestBodyString)
        }
        
        #endif
        
        Loader.loadContentOfUrl(requestString, requestType: .POST, body: requestBodyData, bodyType: .JSON, isAuthenticated: false, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<RegisterResponseModel>().map(JSONString: responseStr))
        })
    }
    
    class func getAccessToken(accessTokenModel: AccessTokenModel, completeHandler: @escaping (_ isSuccess: Bool, _ result : AccessTokenModel?) -> ()) {
    
        let requestString = RequestUtil.getServiceUrlString(.getToken, withParam: [])
    
        let requestBodyData = Mapper<AccessTokenModel>().toJSONString(accessTokenModel, prettyPrint: true)?.toData()
        
        #if DEBUG
        
            if let requestBodyString = Mapper<AccessTokenModel>().toJSONString(accessTokenModel, prettyPrint: true) {
                
                print(requestBodyString)
            }
        
        #endif
        
        Loader.loadContentOfUrl(requestString, requestType: .POST, body: requestBodyData, bodyType: .JSON, isAuthenticated: true, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<AccessTokenModel>().map(JSONString: responseStr))
        })
    }
    
    class func updateProfile(profileModel: ProfileModel, completeHandler: @escaping (_ isSuccess: Bool, _ result : ProfileModel?) -> ()) {
        
        let requestString = RequestUtil.getServiceUrlString(.updateProfile, withParam: [])

        let requestBodyData = Mapper<ProfileModel>().toJSONString(profileModel, prettyPrint: true)?.toData()
        
        #if DEBUG
        
        if let requestBodyString = Mapper<ProfileModel>().toJSONString(profileModel, prettyPrint: true) {
            
            print(requestBodyString)
        }
        
        #endif
        
        Loader.loadContentOfUrl(requestString, requestType: .POST, body: requestBodyData, bodyType: .JSON, isAuthenticated: true, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<ProfileModel>().map(JSONString: responseStr))
        })
    }
    
    class func updateDeviceInfo(deviceModel: DeviceModel, completeHandler: @escaping (_ isSuccess: Bool, _ result : DeviceModel?) -> ()) {
        
        let requestString = RequestUtil.getServiceUrlString(.updateDeviceInfo, withParam: [])
      
        let requestBodyData = Mapper<DeviceModel>().toJSONString(deviceModel, prettyPrint: true)?.toData()
        
        #if DEBUG
        
        if let requestBodyString = Mapper<DeviceModel>().toJSONString(deviceModel, prettyPrint: true) {
            
            print(requestBodyString)
        }
        
        #endif
        
        Loader.loadContentOfUrl(requestString, requestType: .POST, body: requestBodyData, bodyType: .JSON, isAuthenticated: true, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<DeviceModel>().map(JSONString: responseStr))
        })
    }
    
    class func updatePNToken(deviceModel: DeviceModel, completeHandler: @escaping (_ isSuccess: Bool, _ result : DeviceModel?) -> ()) {
        
        let requestString = RequestUtil.getServiceUrlString(.updatePushToken, withParam: [])
        
        let requestBodyData = Mapper<DeviceModel>().toJSONString(deviceModel, prettyPrint: true)?.toData()
        
        #if DEBUG
        
        if let requestBodyString = Mapper<DeviceModel>().toJSONString(deviceModel, prettyPrint: true) {
            
            print(requestBodyString)
        }
        
        #endif
        
        Loader.loadContentOfUrl(requestString, requestType: .POST, body: requestBodyData, bodyType: .JSON, isAuthenticated: true, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<DeviceModel>().map(JSONString: responseStr))
        })
    }
    
    class func getLaundariesList(completeHandler: @escaping (_ isSuccess: Bool, _ result : LaundriesModel?) -> ()) {
        
        let requestString = RequestUtil.getServiceUrlString(.getLaundariesList, withParam: [])
        
        Loader.loadContentOfUrl(requestString, requestType: .GET, bodyType: .JSON, isAuthenticated: false, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<LaundriesModel>().map(JSONString: responseStr))
        })
    }
    
    class func getCitiesList(completeHandler: @escaping (_ isSuccess: Bool, _ result : CitiesModel?) -> ()) {
        
        let requestString = RequestUtil.getServiceUrlString(.getCitieslist, withParam: [])
       
        Loader.loadContentOfUrl(requestString, requestType: .GET, bodyType: .JSON, isAuthenticated: false, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<CitiesModel>().map(JSONString: responseStr))
        })
    }
    
    class func getDiscountList(completeHandler: @escaping (_ isSuccess: Bool, _ result : DiscountsModel?) -> ()) {
        
        let requestString = RequestUtil.getServiceUrlString(.getDiscountList, withParam: [])
        
        Loader.loadContentOfUrl(requestString, requestType: .GET, bodyType: .JSON, isAuthenticated: false, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<DiscountsModel>().map(JSONString: responseStr))
        })
    }
    
    class func getOrderList(completeHandler: @escaping (_ isSuccess: Bool, _ result : OrdersModel?) -> ()) {
        
        let requestString = RequestUtil.getServiceUrlString(.getOrdersList, withParam: [])
        
        Loader.loadContentOfUrl(requestString, requestType: .GET, bodyType: .JSON, isAuthenticated: true, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess, Mapper<OrdersModel>().map(JSONString: responseStr))
        })
    }

    class func checkoutOrder(checkoutRequestModel: OrderCheckoutRequestModel, completeHandler: @escaping (_ isSuccess: Bool) -> ()) {
        
        let requestString = RequestUtil.getServiceUrlString(.checkoutOrder, withParam: [])
       
        let requestBodyData = Mapper<OrderCheckoutRequestModel>().toJSONString(checkoutRequestModel, prettyPrint: true)?.toData()
        
        #if DEBUG
        
        if let requestBodyString = Mapper<OrderCheckoutRequestModel>().toJSONString(checkoutRequestModel, prettyPrint: true) {
            
            print(requestBodyString)
        }
        
        #endif
        
        Loader.loadContentOfUrl(requestString, requestType: .POST, body: requestBodyData, bodyType: .JSON, isAuthenticated: true, completeHandler: { (isSuccess, response, error) -> () in
            
            var responseStr = ""
            
            if let response = response {
                
                responseStr = String(data:response, encoding:String.Encoding.utf8) ?? ""
                
                print("the response string is  \(responseStr)")
            }
            
            completeHandler(isSuccess)
        })
    }
}

extension String {

    func toData() -> Data? {
        
        return self.data(using: String.Encoding.utf8, allowLossyConversion: false)
    }
}
