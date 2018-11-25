//
//  BasicCardCell.swift
//  Hypanion
//
//  Created by hadeel on 11/3/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit

class BasicCardCell : BaseUITableViewCell {
    
    var model : BaseCardModel?
    
    var indexPath: IndexPath?
    
    override init() {
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func initializeView() {
        
        self.clipsToBounds = true
        
        if let style = model?.style {
            
            let opicity = style.backgroundOpicity ?? 1.0
            
            if let background = style.backgroundColor  {
                
                self.backgroundColor = ColorUtil.getSystemColor(background, withOpicity: opicity)
            }
            
            if let separatorInset = style.separatorInset {
                
                self.separatorInset = separatorInset
            }
        }
    }
    
}


