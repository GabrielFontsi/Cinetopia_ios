//
//  CustomMovieView.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 28/05/24.
//

import UIKit

class MovieCellScreen: UIView {

    lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var titleMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var dateMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var favoriteMovieButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconButton = UIImage(systemName: "heart")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        button.setImage(iconButton, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.setupConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupLayout(){
        self.addSubview(self.movieImageView)
        self.addSubview(self.titleMovieLabel)
        self.addSubview(self.dateMovieLabel)
        self.addSubview(self.favoriteMovieButton)
    }
    
    private func setupConstrainst(){
        NSLayoutConstraint.activate([
            self.movieImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.movieImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.movieImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.movieImageView.widthAnchor.constraint(equalToConstant: 78),
            self.movieImageView.heightAnchor.constraint(equalToConstant: 110),
                    
            self.titleMovieLabel.centerYAnchor.constraint(equalTo: self.movieImageView.centerYAnchor, constant: -12),
            self.titleMovieLabel.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 8),
                    
            self.dateMovieLabel.topAnchor.constraint(equalTo: self.titleMovieLabel.bottomAnchor, constant: 8),
            self.dateMovieLabel.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 8),
            
            self.favoriteMovieButton.topAnchor.constraint(equalTo: self.dateMovieLabel.bottomAnchor, constant: 8),
            self.favoriteMovieButton.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 8)
        ])
    }
}
