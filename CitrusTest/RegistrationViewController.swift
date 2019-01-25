//
//  RegistrationViewController.swift
//  CitrusTest
//
//  Created by 1 on 19.01.19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit

public class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    let global = Global()
    let infoCheck = InfoCheck()
    let alertController = UIAlertController()
    var userIsRegistered = Bool()
    var userIsLoggedIn = Bool()
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    
        self.hideKeyboard()
        
        self.registerButton.layer.cornerRadius = 30
        self.registerButton.addTarget(self, action: #selector(register), for: .touchDown)
    }
    
    @objc public func register() {
        self.infoCheck.check(viewController: self,
                        emailTextField: self.emailTextField,
                        passwordTextField: self.passwordTextField,
                        passwordConfirmationTextField: self.passwordConfirmationTextField)
    }
    
}
