//
//  SignUpViewController.swift
//  ARMuseum
//
//  Created by Damon on 2020-05-02.
//  Copyright © 2020 QingsongMeng. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        let userEmail = emailTextField.text
        let userPassword = passwordTextField.text
        let userConfirmPassword = confirmPasswordTextField.text
        let userUsername = usernameTextField.text
        
        if (userEmail!.isEmpty || userPassword!.isEmpty || userConfirmPassword!.isEmpty || userUsername!.isEmpty){
            // Display alert message
            displayMyAlertMessage(view: self, userMessage: "All fields are required!")
            return;
        }
        
        if (!isValidEmail(email: userEmail!)) {
            // display alert message
            displayMyAlertMessage(view: self, userMessage: "Please input a valid email!")
            return;
        }
        
        // check passwords matches each other
        if (userPassword != userConfirmPassword) {
            // Display alert message
            displayMyAlertMessage(view: self, userMessage: "Passwords do not match!")
            return;
        }
        
        displayLoadingOverlay(view: self)
        createUser(email: userEmail!, password: userPassword!, username: userUsername!)
    }
    
    func createUser(email: String, password: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
                self.dismiss(animated: false, completion: nil)
                displayMyAlertMessage(view: self, userMessage: error?.localizedDescription ?? "Error creating user")
            } else {
                Auth.auth().signIn(withEmail: email, password: password)
                self.dismiss(animated: false, completion: nil)
                self.performSegue(withIdentifier: "signUpToAR", sender: self)
            }
        }
    }
}
