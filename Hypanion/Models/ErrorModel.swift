//
//  ErrorModel.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit

class ErrorModel: Mappable {
    
    var message: String?
    var code: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        code                           <- map["code"]
        message                        <- map["message"]
    }
    
    
//    var url: String?
//
//    var code: Int? {
//
//        return alert?.code ?? error?.code
//    }
//
//    var message: String? {
//
//        return ((alert?.message ?? error?.message) ?? getErrorMessage()) ?? NSLocalizedString("DEFAULT_ERROR_MSG",  comment: "DEFAULT_ERROR_MSG")
//    }
//
//    var tagCode : String? {
//
//        return ((error?.metadata) as? [String: Any])?["tag"] as? String
//    }
//
////    var metadata: [AlertMetadataModel]? {
////
////        return alert?.alertMetadata
////    }
//
//    var title: String? {
//
//        return alert?.title ?? error?.title
//    }
//
//    var short: String? {
//
//        return alert?.short ?? error?.short
//    }
//
//    var errors:Any?
//
//    var error: AlertModel?
//
//    var alert: AlertModel?
//
//    required init?(map: Map) {
//
//    }
//
//    func mapping(map: Map) {
//
//        error                           <- map["error"]
//        alert                           <- map["alerts"]
//        errors                          <- map["errors"]
//    }
//
//    init(){}
//
//    func getErrorMessage() -> String? {
//
//        var msg:String? = nil
//
//        if let errors = errors as? [String], errors.count > 0 {
//
//            for str in errors {
//
//                if !str.isEmpty {
//
//                    msg = "\(msg ?? "") \(str)\n"
//                }
//            }
//        } else if let data = (errors as? String)?.data(using: .utf8), let jsonResponse: NSDictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? NSDictionary {
//
//            if let error = jsonResponse.object(forKey: "error") as? String {
//
//                return "\(error)\n"
//            }
//
//            if let errors = jsonResponse.object(forKey: "errors") as? String {
//
//                return  "\(errors)\n"
//            }
//        }
//
//        return msg
//    }
//
//    class func getErrorModel(error: Any, url: String?) -> ErrorModel {
//
//        var model:ErrorModel? = nil
//
//        if let error = error as? Error {
//
//            model = ErrorModel()
//
//            model?.alert = AlertModel()
//            model?.alert?.code = error._code
//            model?.alert?.message = error.localizedDescription
//
//        } else if let error = error as? String {
//
//            model = Mapper<ErrorModel>().map(JSONString: error)
//        }
//
//        model?.url = url
//
//        return model ?? ErrorModel()
//    }
}
