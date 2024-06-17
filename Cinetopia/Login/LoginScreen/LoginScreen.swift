//
//  LoginScreen.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 07/05/24.
//

import UIKit

protocol LoginScreenProtocol: class {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    weak private var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
        

    lazy var logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu e-mail"
        
        textField.text = "Emailteste@gmail.com"
        
        textField.textColor = UIColor(named: "BackgroundColor")
       
        textField.layer.shadowColor = UIColor.white.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowRadius = 3.0
        textField.layer.masksToBounds = false
        return textField
        
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.placeholder = "Digite sua senha"
        
        textField.text = "1234567"
        
        textField.textColor = UIColor(named: "BackgroundColor")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.shadowColor = UIColor.white.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowRadius = 3.0
        textField.layer.masksToBounds = false
       // Criaçao do botao para mostrar e esconder a senha
        let button = UIButton(type: .custom)
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal) // Define a imagem do botão
            button.tintColor = UIColor(named: "BackgroundColor")
            button.frame = CGRect(x: 0, y: 0, width: 30, height: 30) // Define o tamanho do botão
            button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside) // Adiciona ação ao botão
        textField.rightView = button
        textField.rightViewMode = .always // Mostra o botão sempre
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal) // Definir o nome do botão
        button.backgroundColor = UIColor(named: "ButtonBackgroundColor") // Definir cor
        button.titleLabel?.font = .boldSystemFont(ofSize: 20) // Definir fonte e estilo da fonte
        button.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
        button.layer.cornerRadius = 25
        
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 3.0
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tapRegisterButton), for: .touchUpInside)
        
      
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackground()
        self.setupLayout()
        self.setupConstraints()
        self.configButtonEnable(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground(){
        self.backgroundColor = UIColor(named: "BackgroundColor")
    }
    
    private func setupLayout(){
        self.addSubview(self.logoImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    public func validTextField(){
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        } else {
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool){
        if enable {
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else {
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    public func getEmail() -> String {
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 70),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 70),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 32),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 12),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 32),
            self.loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            self.loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            self.loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 32),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            self.registerButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
    @objc func togglePasswordVisibility() {
        // Alterna a visibilidade da senha
        passwordTextField.isSecureTextEntry.toggle()
        // Altera a imagem do botão de acordo com a visibilidade atual da senha
        let button = passwordTextField.rightView as? UIButton
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        button?.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func tapLoginButton(){
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tapRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
}

