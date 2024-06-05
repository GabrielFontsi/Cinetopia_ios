//
//  HomeViewController.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 27/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var filteredMovies:[Movie] = []
    private var isSearchActive: Bool = false
    
    var homeScreen: HomeScreen?
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewDelegate(delegate: self, dataSource: self)
        self.homeScreen?.configSearchDelegate(delegate: self)
        self.setupNavigationBar()
        
    }
    
    private func setupNavigationBar(){
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "Filme populares"
        let searchBar = homeScreen?.searchBar
        navigationItem.titleView = searchBar
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearchActive = false
        } else {
            isSearchActive = true
            filteredMovies = movies.filter({ movie in
                movie.title.lowercased().contains(searchText.lowercased())
            })
        }
        
        homeScreen?.tableViewReloadData()
    
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 
        return isSearchActive ? filteredMovies.count : movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MoviesViewTableViewCell.identifier, for: indexPath) as? MoviesViewTableViewCell {
            let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
            cell.configurationCell(movie: movie)
            print("O que tem no movie \(movies[indexPath.row])")
            print("quantidade ---> \(movies.count) " )
            cell.selectionStyle = .none
            return cell

        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // ? é operador ternário, se a pesquisa estiver ativa, utilizar o filter : se não usar a movies
        let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
