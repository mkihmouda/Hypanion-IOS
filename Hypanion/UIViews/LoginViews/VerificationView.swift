//
//  VerificationView.swift
//  Hypanion
//
//  Created by hadeel on 11/19/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class VerificationView: BaseUIView {
    
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
        label.text = "Please Enter Verification Code That Was To Your Mobile"
        label.textColor = ColorUtil.getSystemColor(.liteGray)
        label.font = FontUtil.getFontWithSize(20, name: .book)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    var verificationCodeView: VerificationCodeView = {
        
        return VerificationCodeView()
        
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
    
    var termOfServicesView: TermOfServicesView = {
        
        return TermOfServicesView()
        
    }()
    
    override func buildViewHierarchy() {
        super.buildViewHierarchy()
        
        self.headerView.addSubview(headerLabel)
        self.addSubview(headerView)
        self.addSubview(imageView)
        self.addSubview(label)
        self.addSubview(verificationCodeView)
        self.addSubview(doneButton)
        self.addSubview(termOfServicesView)

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
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)

        }
        
        self.verificationCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.label.snp.bottom).offset(25)
            make.height.equalTo(100)
            make.width.equalTo(screenSize.width - 40)
        }
        
        self.doneButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.verificationCodeView.snp.bottom)
            make.height.equalTo(60)
            make.width.equalTo(screenSize.width - 40)
            make.centerX.equalTo(self)
        }
        self.termOfServicesView.snp.makeConstraints { (make) in
            make.top.equalTo(self.doneButton.snp.bottom).offset(10)
            make.height.equalTo(60)
            make.leading.trailing.equalTo(self)
            
        }
    }
}
