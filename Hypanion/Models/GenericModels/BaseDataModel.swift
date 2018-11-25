//
//  BaseDataModel.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit

class BaseDataModel: BaseCardModelDelegate {
    
    var models : [BaseCardModel] = []
    
    weak var listDelegate: BaseListDelegate?
    
    init() {
        
    }
    
    func appendModel(_ modelType: ModelType, modelId: String? = nil, modelGroup: String? = nil, modelData : Any? = nil, modelSubData: Any? = nil, currentState : Any? = nil, initialHeight: CGFloat = 60, style:StyleModel? = nil, isCollapsed: Bool = false, delegate: BaseCardModelDelegate? = nil, executeActionOnDidSelect: Bool = true, atIndex: Int? = nil, onSelectModel: (() -> ())? = nil) {
        
        let model = BaseCardModel()
        
        appendModel(model, modelType: modelType, modelId: modelId, modelGroup: modelGroup, modelData: modelData, modelSubData: modelSubData, currentState: currentState, initialHeight: initialHeight, style: style, isCollapsed: isCollapsed, delegate: delegate, executeActionOnDidSelect: executeActionOnDidSelect, atIndex: atIndex, onSelectModel: onSelectModel)
    }
    
    func appendModel(_ model: BaseCardModel, modelType : ModelType, modelId: String? = nil, modelGroup: String? = nil, modelData : Any? = nil,modelSubData : Any? = nil , currentState : Any? = nil, initialHeight: CGFloat = 60, style:StyleModel? = nil, isCollapsed: Bool = false, delegate: BaseCardModelDelegate? = nil,  executeActionOnDidSelect: Bool = true, atIndex: Int? = nil, onSelectModel: (() -> ())? = nil) {
        
        model.modelType = modelType
        
        model.modelId = modelId
        
        model.model = modelData
        
        model.modelGroup =  modelGroup
        
        model.subModel = modelSubData
        
        model.currentState = currentState
        
        model.height = initialHeight
        
        model.onSelectAction = onSelectModel
        
        model.style = style
        
        model.isCollapsed = isCollapsed
        
        model.delegate = delegate
        
        model.executeActionOnDidSelect = executeActionOnDidSelect
        
        if let index = atIndex {
            
            models.insert(model, at: index)
            
        } else {
            
            models.append(model)
        }
    }
    
    func getModelIndex(_ modelType : ModelType) -> Int? {
        
        for (index,model) in models.enumerated() {
            
            if model.modelType == modelType {
                
                return index
            }
        }
        
        //in case its not found
        return nil
    }
    
    func getModels(_ modelType : ModelType) -> [(found: BaseCardModel, index: Int)] {
        
        var modelsForType: [(found: BaseCardModel, index: Int)] = []
        
        for (i, model) in models.enumerated() {
            
            if model.modelType == modelType {
                
                modelsForType.append((model, i))
            }
        }
        
        return modelsForType
    }
    
    func getModelWithId(_ modelId: String) -> (found: BaseCardModel, index: Int)? {
        
        for (index,model) in models.enumerated() {
            
            if model.modelId == modelId {
                
                return (model, index)
            }
        }
        
        //in case its not found
        return nil
    }
    
    func getModelsGroup(_ modelGroup: String) -> [(found: BaseCardModel, index: Int)] {
        
        var modelsForType: [(found: BaseCardModel, index: Int)] = []
        
        for (i, model) in models.enumerated() {
            
            if model.modelGroup == modelGroup {
                
                modelsForType.append((model, i))
            }
        }
        
        return modelsForType
    }
    
    func changeCollapsed(of index: Int, to: Bool? = nil) {
        
        models[index].preCollapsed = models[index].isCollapsed
        
        if let to = to {
            
            models[index].isCollapsed  = to
        } else {
            
            models[index].isCollapsed = !models[index].isCollapsed
        }
    }
    
    // should onle called after changeCollapsed
    func rollbackCollapsed(_ index: Int) {
        
        models[index].isCollapsed = models[index].preCollapsed
    }
    
    func changeGroupCollapsed(_ modelGroup: String, shouldRollback:Bool = false, to: Bool? = nil) {
        
        for model in getModelsGroup(modelGroup) {
            
            if let to = to {
                
                model.found.isCollapsed = to
                
            }else{
                
                if shouldRollback {
                    
                    rollbackCollapsed(model.index)
                    
                } else {
                    
                    changeCollapsed(of: model.index)
                }
            }
        }
    }
    
    func clear() {
        
        self.models.removeAll()
    }
    
    func didChangeModel(_ model: BaseCardModel?) {
        
        // Default implementation, you can orverride in super
        
        guard let modelId = model?.modelId, let index = getModelWithId(modelId)?.index else { return }
        
        listDelegate?.didChangeModelAtIndex?(IndexPath(row: index, section: 0), withRowAnimation: .automatic)
    }
    
    func didRemoveModel(_ model :BaseCardModel?){
        
        // Default implementation, you can override in super when neccessary
        guard let modelId = model?.modelId, let index = getModelWithId(modelId)?.index else { return }
        
        self.listDelegate?.didRemoveModelAtIndex?(IndexPath(item: index, section: 0))
    }
    
    func moveToNext(_ modelIndex: IndexPath) {
        
        // Default implementation
        self.listDelegate?.moveToNext?(modelIndex)
    }
}
