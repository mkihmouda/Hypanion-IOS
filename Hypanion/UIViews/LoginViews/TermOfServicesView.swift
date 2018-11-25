//
//  TermOfServicesView.swift
//  Hypanion
//
//  Created by hadeel on 11/19/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class TermOfServicesView: BaseUIView {
    
    var checkBox: CheckBox = {
        return CheckBox()
    }()
    
    var linkLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Verification Code"
        label.textColor = ColorUtil.getSystemColor(.liteGray)
        label.font = FontUtil.getFontWithSize(16, name: .medium)
        return label
        
    }()

    override func initializeView() {
        self.checkBox.isChecked = false
    }
    override func buildViewHierarchy() {
        super.buildViewHierarchy()
        
        self.addSubview(checkBox)
        self.addSubview(linkLabel)
        
    }
    
    override func setupConstraints() {
        
        self.checkBox.snp.makeConstraints { (make) in
            
            make.top.equalTo(self)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self.linkLabel.snp.leading).offset(-4)
            make.height.equalTo(18)
            make.width.equalTo(18)
        }
        
        self.linkLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self)
            make.leading.equalTo(self.checkBox.snp.trailing).offset(2)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(20)
        }
}

}
    class CheckBox: UIButton {
        // Images
        let checkedImage = UIImage(named: "CheckBox")! as UIImage
        let uncheckedImage = UIImage(named: "CheckBox_empty")! as UIImage
        
        // Bool property
        var isChecked: Bool = false {
            didSet{
                if isChecked == true {
                    self.setImage(checkedImage, for: .normal)
                } else {
                    self.setImage(uncheckedImage, for: .normal)
                }
            }
        }
   
        init() {
            
            super.init(frame: CGRect.zero)
            
            self.addTarget(self, action:#selector(buttonClicked(sender:)), for: .touchUpInside)
        }
        
        override init(frame: CGRect) {
            
            super.init(frame: frame)
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        @objc func buttonClicked(sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
        }
}
