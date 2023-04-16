//
//  RegisterVC.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 15/04/23.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    var auth: Auth?
    
    var alert: Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.alert = Alert(controller: self)
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
    }

}

extension RegisterVC: RegisterScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let email: String = self.registerScreen?.getEmail() else { return }
        guard let password: String = self.registerScreen?.getPassword() else { return }
        
        self.auth?.createUser(withEmail: email, password: password, completion: { result, error in
            if error != nil {
                self.alert?.createAlert(title: "Erro!", message: "Verifique as informações digitadas.")
            } else {
                guard let user = result?.user else { return }
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = self.registerScreen?.nameTextField.text ?? ""
                changeRequest.commitChanges { error in
                    if let error = error {
                        print("Erro ao atualizar o nome do usuário: \(error.localizedDescription)")
                    } else {
                        print("Nome do usuário atualizado com sucesso.")
                    }
                }
                self.alert?.createAlert(title: "Parabéns", message: "Usuário cadastrado com sucesso.", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
        
        
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor  = UIColor.blue.cgColor
        textField.layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if !textField.hasText {
            textField.layer.borderColor  = UIColor.appRedColor.cgColor
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
