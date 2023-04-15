//
//  RegisterVC.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 15/04/23.
//

import UIKit

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configTextFieldDelegate(delegate: self)
    }

}

extension RegisterVC: RegisterScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        print(#function)
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor  = UIColor.blue.cgColor
        textField.layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if !textField.hasText {
            textField.layer.borderColor  = UIColor.red.cgColor
            textField.layer.borderWidth = 2
        } else {
            textField.layer.borderColor  = UIColor.lightGray.cgColor
            textField.layer.borderWidth = 2
        }
        
        self.registerScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
