//
//  HomeScreen.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 27/05/24.
//

import UIKit

class HomeScreen: UIView {
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(MoviesViewTableViewCell.self, forCellReuseIdentifier: MoviesViewTableViewCell.identifier)
        return tableView
    }()
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Pesquisar"
        search.barTintColor = UIColor(named: "BackgroundColor")
        search.searchTextField.backgroundColor = .white
        return search
    }()
    
    public func configTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    public func configSearchDelegate(delegate: UISearchBarDelegate){
            self.searchBar.delegate = delegate
    }
    
    public func tableViewReloadData(){
        tableView.reloadData()
    }

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
       // self.addSubview(self.searchBar)
        self.addSubview(self.tableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
                              
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

