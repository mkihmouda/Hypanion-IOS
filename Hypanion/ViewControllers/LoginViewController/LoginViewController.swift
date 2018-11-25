//
//  LoginViewController.swift
//  Hypanion
//
//  Created by hadeel on 11/17/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: BaseUIViewController {

    var loginView: LoginView? {
        return self.view as? LoginView
    }
    
    override func loadView() {
        
         self.view = LoginView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
}
