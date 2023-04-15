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
