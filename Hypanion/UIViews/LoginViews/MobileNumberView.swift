//
//  MobileNumberView.swift
//  Hypanion
//
//  Created by hadeel on 11/19/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MobileNumberView: BaseUIView {
    
    var countryCodeButton: UIButton = {
        
        let button = UIButton()
        button.titleLabel?.font = FontUtil.getFontWithSize(15, name: .book)
        button.setTitleColor(ColorUtil.getSystemColor(.liteGray), for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitle("+097", for: .normal)
        return button
        
    }()
    
    var codeLine:UILabel = {
        
        let label = UILabel()
        label.backgroundColor = ColorUtil.getSystemColor(SystemColors.liteGray)
        label.textAlignment = isRTL ? .right : .left
        return label
        
    }()
    
    var mobileImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = IconsUtil.imageFor(.MOBILE_NUM_ICON)
        return imageView
    }()
    
    
    var flagImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = IconsUtil.imageFor(.PALESTINE_FLAG_ICON)
        return imageView
    }()
    
    
    var mobileNumberText:UITextField = {
        
        let textField = UITextField()
        textField.keyboardType = UIKeyboardType.numberPad
        textField.textAlignment = isRTL ? .right : .left
        textField.text = "0595444735"
        textField.font = FontUtil.getFontWithSize(15, name: .book)
        textField.textColor = ColorUtil.getSystemColor(.liteBlue)
        return textField
        
    }()
    
    var line:UILabel = {
        
        let label = UILabel()
        label.backgroundColor = ColorUtil.getSystemColor(.liteBlue)
        return label
        
    }()
    
    override func buildViewHierarchy() {
        
        self.addSubview(flagImage)
        self.addSubview(codeLine)
        self.addSubview(countryCodeButton)
        self.addSubview(mobileImage)
        self.addSubview(mobileNumberText)
        self.addSubview(line)
        
    }
    
    override func setupConstraints() {
        
        flagImage.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(70)
            make.width.equalTo(23)
            make.height.equalTo(16)
            make.centerY.equalTo(self)
        }
        
        countryCodeButton.snp.makeConstraints { make in
            
            make.left.equalTo(self).offset(95)
            make.width.equalTo(50)
            make.height.equalTo(25)
            make.centerY.equalTo(self)
        }
        
        codeLine.snp.makeConstraints { make in
            
            make.left.equalTo(self).offset(65)
            make.width.equalTo(80)
            make.top.equalTo(self.countryCodeButton.snp.bottom)
            make.height.equalTo(1)
        }
        
        mobileImage.snp.makeConstraints { make in
            
            make.left.equalTo(self.countryCodeButton).offset(60)
            make.centerY.equalTo(self)
            make.width.equalTo(22)
            make.height.equalTo(25)
        }
        
        mobileNumberText.snp.makeConstraints { make in
            
            make.left.equalTo(self.countryCodeButton).offset(90)
            make.right.equalTo(self).offset(-16)
            make.centerY.equalTo(self)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
        
        line.snp.makeConstraints { make in
            
            make.top.equalTo(self.mobileNumberText.snp.bottom)
            make.left.equalTo(self.countryCodeButton).offset(60)
            make.height.equalTo(1)
            make.width.equalTo(150)
            
        }
        
    }
    
}
