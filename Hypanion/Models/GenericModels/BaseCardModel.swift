//
//  BaseCardModel.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit

class BaseCardModel: Equatable {
    
    var modelId: String?
    
    var modelGroup:String?
    
    var modelType : ModelType?
    
    var model : Any?
    
    var subModel : Any?
    
    var currentState : Any?
    
    var onSelectAction : (() -> ())?
    
    var executeActionOnDidSelect : Bool = true
    
    var height : CGFloat = 60
    
    var isCollapsed: Bool = false
    
    var preCollapsed: Bool = false
    
    var style:StyleModel?
    
    weak var delegate: BaseCardModelDelegate?
    
    func calculcateHeight() -> CGFloat {
        
        return isCollapsed ? 0 : height
    }
    
    func equal(to: BaseCardModel) -> Bool {
        return self == to
    }
}

func ==(lhs: BaseCardModel, rhs: BaseCardModel) -> Bool {
    
    return lhs.equal(to: rhs)
}



