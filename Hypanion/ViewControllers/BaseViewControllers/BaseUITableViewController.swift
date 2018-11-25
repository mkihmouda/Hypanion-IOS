//
//  BaseUITableViewController.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit

class BaseUITableViewController: BaseUIViewController {
    
    var indexToScrollTo: IndexPath?
    
    var listModel : BaseDataModel?
    
    var effectiveTableView: UITableView? {
        
        didSet {
            
            effectiveTableView?.showsVerticalScrollIndicator = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            
            self.effectiveTableView?.contentInsetAdjustmentBehavior = .never
        }
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(_ notification: Notification) {
        
        let keyboardHeight: CGFloat = 100.0
        
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            
            self?.effectiveTableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            
        }){ [weak self] isSuccess in
            
            if let index = self?.indexToScrollTo {
                
                self?.effectiveTableView?.scrollToRow(at: index, at: .top, animated: true)
                
                self?.indexToScrollTo = nil
            }
        }
    }
    
    @objc fileprivate func keyboardWillHide(_ notification: Notification) {
        
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            
            self?.effectiveTableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        })
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    func postInitialization(_ cell: BasicCardCell, modelType: ModelType?, indexPath: IndexPath) -> UITableViewCell {
        
        return cell
    }
}


extension BaseUITableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if #available(iOS 11, *) {
            
            guard let baseCardModel = listModel?.models[safe: indexPath.row] else { return 60 }
            
            let height = baseCardModel.calculcateHeight()
            
            return height > 0 ? height : 0
            
        } else {
            
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let baseCardModel = listModel?.models[safe: indexPath.row] else { return UITableViewCell() }
        
        let cell = CellFactory.constructCell(baseCardModel, tableView : tableView, indexPath: indexPath as IndexPath)
        
        
        return postInitialization(cell, modelType: baseCardModel.modelType, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listModel?.models.count ?? 0
    }
}

extension BaseUITableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dismissKeyboard()
        
        guard let baseCardModel = listModel?.models[safe: indexPath.row] else { return }
        
        if baseCardModel.executeActionOnDidSelect {
            
            baseCardModel.onSelectAction?()
        }
    }
}

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
