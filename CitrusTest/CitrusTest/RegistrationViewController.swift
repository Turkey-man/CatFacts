//
//  RegistrationViewController.swift
//  CitrusTest
//
//  Created by 1 on 19.01.19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard
let userData: [String: String] = ["UserEmail": "value"]

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    let alertController = UIAlertController()
    
    let defaults = UserDefaults.standard
    let userData: [String: String] = ["UserEmail": "value"]
    var userIsRegistered = Bool()
    var userIsLoggedIn = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.hideKeyboard()
        
        registerButton.layer.cornerRadius = 30
        registerButton.addTarget(self, action: #selector(register), for: .touchDown)
    }
    
    @objc func register() {
        guard let enteredEmail = emailTextField.text, enteredEmail.isValidEmail() else {
            self.alertController.alert(title: "Wrong email", message: "Enter correct email!", style: .alert, presentOn: self)
            return
        }
        guard let enteredPassword = passwordTextField.text, enteredPassword.count >= 5 else {
            self.alertController.alert(title: "Invalid password", message: "Password must have at least 5 characters!", style: .alert, presentOn: self)
            return
        }
        guard let passwordConfirmation = passwordConfirmationTextField.text, passwordConfirmation.elementsEqual(enteredPassword) else {
            self.alertController.alert(title: "Passwords don't match", message: "Enter the same password!", style: .alert, presentOn: self)
            return
        }
        userIsLoggedIn = true
        userIsRegistered = true
        defaults.set(String(enteredEmail), forKey: "email")
        defaults.set(String(enteredPassword), forKey: "password")
        defaults.set(Bool(userIsRegistered), forKey: "userIsRegistered")
        defaults.set(Bool(userIsLoggedIn), forKey: "userIsLoggedIn")
        
        self.performSegue(withIdentifier: "register", sender: nil)
    }
    
}
