//
//  RegisterScreen.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 10/05/24.
//

import UIKit

protocol RegisterScreenProtocol: class {
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
   public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }

    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu e-mail"
        textField.textColor = UIColor(named: "BackgroundColor")
       
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowRadius = 3.0
        textField.layer.masksToBounds = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.placeholder = "Digite sua senha"
        textField.textColor = UIColor(named: "BackgroundColor")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.shadowColor = UIColor.black.cgColor
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
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal) // Definir o nome do botão
        button.backgroundColor = UIColor(named: "ButtonBackgroundColor") // Definir cor
        button.titleLabel?.font = .boldSystemFont(ofSize: 20) // Definir fonte e estilo da fonte
        button.addTarget(self, action: #selector(tapRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackground()
        self.setupLayout()
        self.setupConstraints()
        //self.configButtonEnable(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground(){
        self.backgroundColor = UIColor(named: "BackgroundColor")
    }
    
    private func setupLayout(){
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
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
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        }else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
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
            self.emailTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 12),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 32),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 50)
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
    
    @objc private func tapRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
}

