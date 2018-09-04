//
//  ViewController.swift
//  SampleApp
//
//  Created by Steve Wilford on 19/08/2018.
//  Copyright © 2018 Off Topic. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var buttonsContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        resetUI()
//    }
    
    @IBAction func register() {
    }
    
    @IBAction func login() {
        buttonsContainer.isHidden = true
        activityIndicator.startAnimating()
        usernameTextField.isEnabled = false
        passwordTextField.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: randomLoginDelay,
                                      execute: doLogin)
    }
    
    private var randomLoginDelay: DispatchTime {
        let maximumSeconds: UInt32 = 5
        let randomSeconds = Double(arc4random_uniform(maximumSeconds * 10)) / 10.0
        return DispatchTime.now() + randomSeconds
    }
    
    private func doLogin() {
        if credentialsAreValid() {
            navigateToLoggedInScreen()
        } else {
            showInvalidCredentialsMessage()
            resetUI()
        }
    }
    
    private func navigateToLoggedInScreen() {
        performSegue(withIdentifier: "showApp", sender: self)
    }
    
    private func showInvalidCredentialsMessage() {
        let alert = UIAlertController(title: "Access Denied",
                                      message: "Your username or password are incorrect",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        show(alert, sender: self)
    }
    
    private func resetUI() {
        activityIndicator.stopAnimating()
        buttonsContainer.isHidden = false
        usernameTextField.isEnabled = true
        passwordTextField.isEnabled = true
    }
    
    private func credentialsAreValid() -> Bool {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        return username == "admin" && password == "password"
    }
    
    @IBAction func enableButtonsIfValid() {
        let shouldEnable = fieldsHaveContent()
        registerButton.isEnabled = shouldEnable
        loginButton.isEnabled = shouldEnable
    }
    
    private func fieldsHaveContent() -> Bool {
        return (usernameTextField.text?.count ?? 0) > 0
            && (passwordTextField.text?.count ?? 0) > 0
    }
}

