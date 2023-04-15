//
//  LoginScreen.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 13/04/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var logoAppImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logo")
        return img
    }()
    
    lazy var appNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .appGreenColor
        lb.font = UIFont(name: "ChalkboardSE-Bold", size: 50)
        lb.text = "Note App"
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var appDescriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "The note taker app"
        lb.font = UIFont(name: "ChalkboardSE-Bold", size: 50)
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 20)
        return lb
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite seu email"
        tf.textColor = .darkGray
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .clear
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 16
        tf.layer.borderColor = UIColor.appGreenColor.cgColor
        tf.layer.borderWidth = 2.0
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua senha"
        tf.textColor = .darkGray
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .clear
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
        tf.keyboardType = .default
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 16
        tf.layer.borderColor = UIColor.appGreenColor.cgColor
        tf.layer.borderWidth = 2.0
        return tf
    }()
    
    lazy var loginButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .appGreenColor
        btn.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Novo por aqui? Cadastre-se", for: .normal)
        btn.setTitleColor(.appGreenColor, for: .normal)
        btn.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    @objc private func loginButtonPressed() {
        self.delegate?.actionLoginButton()
    }
    
    @objc private func registerButtonPressed() {
        self.delegate?.actionRegisterButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addElements()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoAppImageView)
        addSubview(appNameLabel)
        addSubview(appDescriptionLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButtonView)
        loginButtonView.addSubview(loginButton)
        addSubview(registerButton)
    }
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 150),
            logoAppImageView.widthAnchor.constraint(equalToConstant: 150),
            logoAppImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            appNameLabel.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 50),
            appNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            appNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            appDescriptionLabel.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 10),
            appDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            appDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            
            emailTextField.topAnchor.constraint(equalTo: appDescriptionLabel.bottomAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

            
            loginButtonView.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 40),
            loginButtonView.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            loginButtonView.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            loginButtonView.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            
            
            loginButton.topAnchor.constraint(equalTo: loginButtonView.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: loginButtonView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginButtonView.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: loginButtonView.bottomAnchor),
            
            registerButton.topAnchor.constraint(equalTo: loginButtonView.bottomAnchor, constant: 10),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
}
