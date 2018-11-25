//
//  VerificationViewController.swift
//  Hypanion
//
//  Created by hadeel on 11/19/18.
//  Copyright © 2018 Hadeel. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class VerificationViewController: BaseUIViewController {
    
    var loginView: VerificationView? {
        return self.view as? VerificationView
    }
    
    override func loadView() {
        
        self.view = VerificationView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
}
