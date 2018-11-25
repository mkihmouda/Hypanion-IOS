//
//  LoginView.swift
//  Hypanion
//
//  Created by hadeel on 11/19/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LoginView: BaseUIView {
    
    var headerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = ColorUtil.getSystemColor(.liteBlue)
        return view
    }()
    
    var headerLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Hypanion"
        label.textColor = ColorUtil.getSystemColor(.white)
        label.font = FontUtil.getFontWithSize(25, name: .medium)
        return label
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = IconsUtil.imageFor(.MOBILE_ICON)
        return imageView
    }()
    
    var label: UILabel = {
        
        let label = UILabel()
        label.text = "Verify your number"
        label.textColor = ColorUtil.getSystemColor(.liteGray)
        label.font = FontUtil.getFontWithSize(20, name: .book)
        return label
    }()
    
    var mobileNumberView: MobileNumberView = {
        
        return MobileNumberView()
        
    }()
    
    var doneButton: UIButton = {
        
        let button = UIButton()
        button.titleLabel?.font = FontUtil.getFontWithSize(25, name: .heavy)
        button.setTitleColor(ColorUtil.getSystemColor(.white), for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitle("Done", for: .normal)
        button.backgroundColor = ColorUtil.getSystemColor(.liteBlue)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.layer.borderColor = ColorUtil.getSystemColor(.white).cgColor
        return button
        
    }()
    override func buildViewHierarchy() {
        super.buildViewHierarchy()
        
        self.headerView.addSubview(headerLabel)
        self.addSubview(headerView)
        self.addSubview(imageView)
        self.addSubview(label)
        self.addSubview(mobileNumberView)
        self.addSubview(doneButton)
        
    }
    
    override func setupConstraints() {
        
        self.headerView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(70)
        }
        
        self.headerLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.headerView).offset(16)
            make.height.equalTo(50)
            make.width.equalTo(200)
            make.bottom.equalTo(self.headerView.snp.bottom).offset(-5)
        }
        
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerView.snp.bottom).offset(60)
            make.height.equalTo(110)
            make.width.equalTo(95)
            make.centerX.equalTo(self)
        }
        
        self.label.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(5)
            make.centerX.equalTo(self)
            
        }
        
        self.mobileNumberView.snp.makeConstraints { (make) in
            make.top.equalTo(self.label.snp.bottom).offset(25)
            make.height.equalTo(30)
            make.width.equalTo(screenSize.width)
        }
        
        self.doneButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-30)
            make.height.equalTo(60)
            make.width.equalTo(screenSize.width - 40)
            make.centerX.equalTo(self)
        }
    }
}
