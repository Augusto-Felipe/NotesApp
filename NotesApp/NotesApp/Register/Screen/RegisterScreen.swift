//
//  RegisterScreen.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 15/04/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
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
        btn.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    @objc private func backButtonPressed() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func registerButtonPressed() {
        self.delegate?.actionRegisterButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appGreenColor
        configInitialRegisterButtonState()
        addElements()
        configBackButtonConstraints()
        configRegisterImageConstraints()
        configNameTextFieldConstraints()
        configEmailTextFieldConstraints()
        configPasswordTextFieldConstraints()
        configConfirmPasswordTextFieldConstraints()
        configRegisterButtonConstraints()
    }
    
    public func configInitialRegisterButtonState() {
        self.registerButton.isEnabled = false
        self.registerButton.setTitleColor(.lightGray, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func validateTextFields() {
        
        if self.nameTextField.hasText && self.emailTextField.hasText && self.passwordTextField.hasText && self.confirmPasswordTextField.hasText {
            
            if self.passwordTextField.text == self.confirmPasswordTextField.text {
                configButtonEnable(enable: true)
            } else {
                configButtonEnable(enable: false)
            }
        } else {
            registerButton.isEnabled = false
            registerButton.setTitleColor(.lightGray, for: .normal)
        }
    }
    
    public func configButtonEnable(enable: Bool) {
        
        if enable == true {
            registerButton.isEnabled = true
            registerButton.setTitleColor(.white, for: .normal)
        } else {
            registerButton.isEnabled = false
            passwordTextField.layer.borderColor = UIColor(red: 226/255, green: 24/255, blue: 24/255, alpha: 1.0).cgColor
            confirmPasswordTextField.layer.borderColor = UIColor(red: 226/255, green: 24/255, blue: 24/255, alpha: 1.0).cgColor
        }
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
    
    private func configBackButtonConstraints() {
        self.backButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
    
    private func configRegisterImageConstraints() {
        self.registerImage.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
    }
    
    private func configNameTextFieldConstraints() {
        self.nameTextField.snp.makeConstraints { make in
            make.top.equalTo(registerImage.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
    }
    
    private func configEmailTextFieldConstraints() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(15)
            make.leading.equalTo(nameTextField.snp.leading)
            make.trailing.equalTo(nameTextField.snp.trailing)
            make.height.equalTo(nameTextField.snp.height)
        }
    }
    
    private func configPasswordTextFieldConstraints() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    private func configConfirmPasswordTextFieldConstraints() {
        self.confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    private func configRegisterButtonConstraints() {
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(30)
            make.leading.equalTo(nameTextField.snp.leading)
            make.trailing.equalTo(nameTextField.snp.trailing)
            make.height.equalTo(nameTextField.snp.height)
        }
    }
}
