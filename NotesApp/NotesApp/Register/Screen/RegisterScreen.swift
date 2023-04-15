//
//  RegisterScreen.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 15/04/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
}

class RegisterScreen: UIView {
    
    var delegate: RegisterScreenProtocol?
    
    public func delegate(delegate: RegisterScreenProtocol) {
        self.delegate = delegate
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.nameTextField.delegate = delegate
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.confirmPasswordTextField.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var registerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite seu nome"
        tf.textColor = .darkGray
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 16
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite seu email"
        tf.textColor = .darkGray
        tf.autocorrectionType = .no
        tf.keyboardType = .emailAddress
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 16
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua senha"
        tf.textColor = .darkGray
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 16
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Confirme sua senha"
        tf.textColor = .darkGray
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 16
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Cadastrar", for: .normal)
        btn.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 96/255, green: 153/255, blue: 102/255, alpha: 1.0)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    @objc private func backButtonPressed() {
        self.delegate?.actionBackButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appGreenColor
        addElements()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(backButton)
        addSubview(registerImage)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(registerButton)
    }
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.backButton.heightAnchor.constraint(equalToConstant: 40),
            self.backButton.widthAnchor.constraint(equalToConstant: 40),
            
            self.registerImage.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 50),
            self.registerImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registerImage.heightAnchor.constraint(equalToConstant: 150),
            self.registerImage.widthAnchor.constraint(equalToConstant: 150),
            
            self.nameTextField.topAnchor.constraint(equalTo: registerImage.bottomAnchor, constant: 50),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
            
            self.passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
            
            self.confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            self.confirmPasswordTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.confirmPasswordTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.confirmPasswordTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 30),
            self.registerButton.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
        
        ])
    }
    
}
