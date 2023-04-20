//
//  ViewController.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 13/04/23.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    var auth: Auth?
    
    var alert: Alert?

    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        self.loginScreen?.passwordTextField.text = ""
    }

    override func viewDidLoad() {   
        super.viewDidLoad()
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        self.loginScreen?.delegate  = self
        self.loginScreen?.configTextFieldDelegate(delegate: self)
    }
    
}

extension LoginVC: LoginScreenProtocol {
    
    func actionLoginButton() {
        
        guard let login = self.loginScreen else { return }
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword() , completion: { result, error in
            
            if error != nil {
                self.alert?.createAlert(title: "Dados Incorretos", message: "Verifique as informações")
            } else if result == nil {
                self.alert?.createAlert(title: "Tivemos um problema inesperado.", message: "Tente novamente mais tarde.")
            } else {
                self.alert?.createAlert(title: "Logado com sucesso", message: "Vamos lá o/", completion: {
                    let vc = HomeVC()
                    self.navigationController?.pushViewController(vc, animated: true)
                })
                
            }
        })
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
            textField.layer.borderColor = UIColor.appRedColor.cgColor
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

