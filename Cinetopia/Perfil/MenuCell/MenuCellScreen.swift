//
//  MenuCellScreen.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 06/06/24.
//

import UIKit

class MenuCellScreen: UIView {
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        return image
    }()
    
    lazy var nameIconLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.setupConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        self.addSubview(self.iconImageView)
        self.addSubview(self.nameIconLabel)
        }
    
    private func setupConstrainsts(){
        NSLayoutConstraint.activate([
            //self.iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            self.iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            self.iconImageView.heightAnchor.constraint(equalToConstant: 20),
            self.iconImageView.widthAnchor.constraint(equalToConstant: 20),
            
            //self.nameIconLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.nameIconLabel.leadingAnchor.constraint(equalTo: self.iconImageView.trailingAnchor, constant: 18),
            self.nameIconLabel.centerYAnchor.constraint(equalTo: self.iconImageView.centerYAnchor)

        ])
    }
}