//
//  MoviesViewTableViewCell.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 28/05/24.
//

import UIKit

class MoviesViewTableViewCell: UITableViewCell {

    static let identifier: String = "MoviesViewTableViewCell"

    lazy var movieCellScreen = {
        let view = MovieCellScreen()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        self.contentView.addSubview(self.movieCellScreen)
    }
    
    public func configurationCell(movie: Movie) {
        self.movieCellScreen.movieImageView.image = UIImage(named: movie.image)
        self.movieCellScreen.titleMovieLabel.text = movie.title
        self.movieCellScreen.dateMovieLabel.text = "Lançamento: \(movie.releaseDate)"
    }
    

    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.movieCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.movieCellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.movieCellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.movieCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
    
}


