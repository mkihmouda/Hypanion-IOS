//
//  VerificationCodeView.swift
//  Hypanion
//
//  Created by hadeel on 11/19/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class VerificationCodeView: BaseUIView {

    var verificationLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Verification Code"
        label.textColor = ColorUtil.getSystemColor(.liteGray)
        label.font = FontUtil.getFontWithSize(18, name: .medium)
        return label
    }()
    
    var verificationTextField: UITextField = {
        
        let textField = UITextField()
        textField.keyboardType = UIKeyboardType.numberPad
        textField.textAlignment = isRTL ? .right : .left
        textField.text = "HYP1290"
        textField.font = FontUtil.getFontWithSize(15, name: .book)
        textField.textColor = ColorUtil.getSystemColor(.liteBlue)
        return textField
    }()
    
    var line:UIView = {
        
        let view = UIView()
        view.backgroundColor = ColorUtil.getSystemColor(.liteBlue)
        return view
        
    }()
    override func buildViewHierarchy() {
        super.buildViewHierarchy()
        
        self.addSubview(verificationLabel)
        self.addSubview(verificationTextField)
        self.addSubview(line)
    }
    
    override func setupConstraints() {
        
        self.verificationLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(30)
        }
        
        self.verificationTextField.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.verificationLabel.snp.bottom).offset(2)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(30)
        
        }
        
        self.line.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.verificationTextField.snp.bottom).offset(2)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(1)
            
        }
    }
}
