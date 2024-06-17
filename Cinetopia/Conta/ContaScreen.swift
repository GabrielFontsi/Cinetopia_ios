//
//  ContaScreen.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 12/06/24.
//

import UIKit

protocol ContaScreenProtocol: class {
    func actionLibriryButton()
    func actionCameraButton()
    func actionEditPhotoButton()
}

class ContaScreen: UIView {
    
    weak private var delegate: ContaScreenProtocol?
    
    func delegate(delegate: ContaScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var imagePerfilUIimageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.circle.fill")
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 60
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [libraryPhotoButton, cameraPhotoButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var editPhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Editar foto", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(tapEditPhotpButton), for: .touchUpInside)
        return button
    }()
    
    lazy var libraryPhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Abrir biblioteca", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 5
        
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 3.0
        button.layer.masksToBounds = false
        
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(tapLibriryPhotoButton), for: .touchUpInside)
        return button
    }()
    
    lazy var cameraPhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Abrir camera", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 5
        
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 3.0
        button.layer.masksToBounds = false
        
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(tapCameraPhotoButton), for: .touchUpInside)
        return button
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
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
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.placeholder = "Digite sua senha"
        textField.textColor = UIColor(named: "BackgroundColor")
        
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
    
    lazy var saveInformationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "ButtonBackgroundColor")
        button.setTitle("Salvar informações", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 25
        
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 3.0
        button.layer.masksToBounds = false
        
        //button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tapSaveInformationButton), for: .touchUpInside)
        return button
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackground()
        self.setupLayout()
        self.setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground(){
        self.backgroundColor = UIColor(named: "BackgroundColor")
    }
    
    private func setupLayout(){
        self.addSubview(self.imagePerfilUIimageView)
        self.addSubview(self.editPhotoButton)
        //self.addSubview(self.stackView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.saveInformationButton)

    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.imagePerfilUIimageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 18),
            self.imagePerfilUIimageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imagePerfilUIimageView.widthAnchor.constraint(equalToConstant: 120),
            self.imagePerfilUIimageView.heightAnchor.constraint(equalToConstant: 120),
            
            self.editPhotoButton.topAnchor.constraint(equalTo: self.imagePerfilUIimageView.bottomAnchor, constant: 5),
            self.editPhotoButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.editPhotoButton.heightAnchor.constraint(equalToConstant: 50),
           
            
//            self.stackView.topAnchor.constraint(equalTo: self.imagePerfilUIimageView.bottomAnchor, constant: 18),
//            self.stackView.heightAnchor.constraint(equalToConstant: 55),
//            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
//            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
//
//            self.libraryPhotoButton.topAnchor.constraint(equalTo: self.imagePerfilUIimageView.bottomAnchor, constant: 18),
//            self.libraryPhotoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
//            self.libraryPhotoButton.trailingAnchor.constraint(equalTo: self.cameraPhotoButton.leadingAnchor, constant: 12),
//            self.libraryPhotoButton.heightAnchor.constraint(equalToConstant: 45),
//            self.libraryPhotoButton.widthAnchor.constraint(equalToConstant: 45),
//
//            self.cameraPhotoButton.topAnchor.constraint(equalTo: self.imagePerfilUIimageView.bottomAnchor, constant: 18),
//            self.cameraPhotoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
//            self.cameraPhotoButton.heightAnchor.constraint(equalToConstant: 45),
//            self.cameraPhotoButton.widthAnchor.constraint(equalToConstant: 45),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.editPhotoButton.bottomAnchor, constant: 18),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 12),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.saveInformationButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 32),
            self.saveInformationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            self.saveInformationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            self.saveInformationButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    @objc private func tapEditPhotpButton(){
        self.delegate?.actionEditPhotoButton()
    }
    
    @objc private func tapLibriryPhotoButton(){
        self.delegate?.actionLibriryButton()
    }
    
    @objc private func tapCameraPhotoButton(){
        self.delegate?.actionCameraButton()
    }
    
    @objc func togglePasswordVisibility() {
        // Alterna a visibilidade da senha
        passwordTextField.isSecureTextEntry.toggle()
        
        // Altera a imagem do botão de acordo com a visibilidade atual da senha
        let button = passwordTextField.rightView as? UIButton
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        button?.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func tapSaveInformationButton(){
        print("botão salvar informação clicado")
    }
    
}
