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
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
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
        btn.isEnabled = false
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
    
    public func validateTextFields() {
        if emailTextField.hasText && passwordTextField.hasText {
            configEnableButton(enable: true)
        } else {
            configEnableButton(enable: false)
        }
    }
    
    public func configEnableButton(enable: Bool) {
        if enable == true {
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        self.configEnableButton(enable: true)
        addElements()
        configLogoImageViewConstraints()
        configAppNameLabelConstraints()
        configAppDescriptionLabelConstraints()
        configEmailTextFieldConstraints()
        configPasswordTextFieldConstraints()
        configLoginButtonViewConstraints()
        configLoginButtonConstraints()
        configRegisterButtonConstraints()
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
    
    public func getEmail() -> String {
        return emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return passwordTextField.text ?? ""
    }
    
    private func configLogoImageViewConstraints() {
        self.logoAppImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            make.height.equalTo(150)
            make.width.equalTo(150)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configAppNameLabelConstraints() {
        self.appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(logoAppImageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
        }
    }
    
    private func configAppDescriptionLabelConstraints() {
        self.appDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
        }
    }
    
    private func configEmailTextFieldConstraints() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(40)
        }
    }
    
    private func configPasswordTextFieldConstraints() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    private func configLoginButtonViewConstraints() {
        self.loginButtonView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(40)
            make.leading.equalTo(passwordTextField.snp.leading)
            make.trailing.equalTo(passwordTextField.snp.trailing)
            make.height.equalTo(passwordTextField.snp.height)
        }
    }
    
    private func configLoginButtonConstraints() {
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(loginButtonView.snp.top)
            make.leading.equalTo(loginButtonView.snp.leading)
            make.trailing.equalTo(loginButtonView.snp.trailing)
            make.height.equalTo(loginButtonView.snp.height)
        }
    }
    
    private func configRegisterButtonConstraints() {
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButtonView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}
