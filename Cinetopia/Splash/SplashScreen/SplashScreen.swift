//
//  SplashScreen.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 07/05/24.
//

import UIKit

protocol SplashScreenProtocol: class {
    func actionWelcomeButton()
}

class SplashScreen: UIView {
    
    weak private var delegate: SplashScreenProtocol?
    
    func delegate(delegate: SplashScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var coupleImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Couple"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O lugar ideial para buscar, salvar e organizar seus filmes favoritos!"
        label.textColor = .white //Cor do texto
        label.numberOfLines = 0 // Sem limite de linhas
        label.textAlignment = .center // Alinhamento do texto
        label.font = .systemFont(ofSize: 20, weight: .semibold) // Tamanho e estilo da fonte
        return label
    }()
    
    lazy var welcomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Quero começar", for: .normal)
        button.backgroundColor = UIColor(named: "ButtonBackgroundColor")
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(welcomeButtonPressed), for: .touchUpInside)
        
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 3.0
        button.layer.masksToBounds = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImageView, coupleImageView, welcomeLabel, welcomeButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackground()
        self.setupLayout()
        self.setupConstraints()
    }
    
    private func setupBackground(){
        self.backgroundColor = UIColor(named: "BackgroundColor")
    }
    
    private func setupLayout(){
        self.addSubview(self.stackView)
    }
    
    @objc private func welcomeButtonPressed(){
        self.delegate?.actionWelcomeButton()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            
            self.welcomeButton.heightAnchor.constraint(equalToConstant: 50),
            self.welcomeButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 18),
            self.welcomeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -18),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


