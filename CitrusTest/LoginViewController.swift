//
//  LoginViewController.swift
//  CitrusTest
//
//  Created by 1 on 19.01.19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    let infoCheck = InfoCheck()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        self.loginButton.layer.cornerRadius = 30
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Log in"
    }
    
    @IBAction func performLogin(_ sender: Any) {
        self.infoCheck.loginCheck(viewController: self, emailTextField: emailTextField, passwordTextField: passwordTextField)
    }
}
