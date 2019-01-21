//
//  LoginViewController.swift
//  CitrusTest
//
//  Created by 1 on 19.01.19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let alertController = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        
        self.loginButton.layer.cornerRadius = 30
        
        navigationController?.navigationBar.isHidden = true
        navigationItem.hidesBackButton = true
        navigationItem.title = "Log in"
    }
    
    @IBAction func performLogin(_ sender: Any) {
        let savedEmail = defaults.string(forKey: "email")
        let savedPassword = defaults.string(forKey: "password")

        guard let enteredEmail = emailTextField.text, enteredEmail == savedEmail  else {
            self.alertController.alert(title: "Wrong email", message: "Enter correct email!", style: .alert, presentOn: self)
            return
        }
        guard let enteredPassword = passwordTextField.text, enteredPassword == savedPassword else {
            self.alertController.alert(title: "Wrong password", message: "You've entered the wrong password!", style: .alert, presentOn: self)
            return
        }
        defaults.set(true, forKey: "userIsLoggedIn")
        self.performSegue(withIdentifier: "login", sender: nil)
        navigationController?.navigationBar.isHidden = false
    }
}
