//
//  LoginViewController.swift
//  ARMuseum
//
//  Created by Damon on 2020-05-02.
//  Copyright © 2020 QingsongMeng. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "loginToAR", sender: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if (email!.isEmpty) || (password!.isEmpty) {
            ARMuseum.displayMyAlertMessage(view: self, userMessage: "Please fill all fields!")
        }
        
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            if error == nil {
                self.performSegue(withIdentifier: "loginToAR", sender: self)
            } else {
                ARMuseum.displayMyAlertMessage(view: self, userMessage: error?.localizedDescription ?? "Error logging in")
            }
        }
    }
}
