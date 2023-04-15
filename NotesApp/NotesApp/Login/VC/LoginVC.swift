//
//  ViewController.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 13/04/23.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?

    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate  = self
        self.loginScreen?.configTextFieldDelegate(delegate: self)
    }
    
}

extension LoginVC: LoginScreenProtocol {
    
    func actionLoginButton() {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func actionRegisterButton() {
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 3
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if !textField.hasText {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        self.loginScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.loginScreen?.emailTextField {
            self.loginScreen?.passwordTextField.becomeFirstResponder()
        }
        
        textField.resignFirstResponder()
        return true
    }
}

