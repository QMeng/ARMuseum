//
//  Util.swift
//  ARMuseum
//
//  Created by Damon on 2020-05-02.
//  Copyright © 2020 QingsongMeng. All rights reserved.
//

import Foundation
import UIKit
import Firebase

func displayMyAlertMessage(view: UIViewController, userMessage: String) {
    let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
    
    myAlert.addAction(okAction)
    view.present(myAlert, animated: true, completion: nil)
}

func isValidEmail(email:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: email)
}

func displayLoadingOverlay(view: UIViewController) {
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    loadingIndicator.hidesWhenStopped = true
    loadingIndicator.style = UIActivityIndicatorView.Style.gray
    loadingIndicator.startAnimating();
    
    alert.view.addSubview(loadingIndicator)
    view.present(alert, animated: true, completion: nil)
}
