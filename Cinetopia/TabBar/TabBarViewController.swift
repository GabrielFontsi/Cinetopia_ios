//
//  TabBarViewController.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 28/05/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
        self.navigationItem.setHidesBackButton(true, animated: true)

        // Do any additional setup after loading the view.
    }
    
    private func setupTabBarController(){
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        
        let home = UINavigationController(rootViewController: HomeViewController())
        let homeSymbol = UIImage(systemName: "film", withConfiguration: symbolConfiguration)
        home.tabBarItem.image = homeSymbol
        home.tabBarItem.title = "Filmes Populares"
        
        let favoriteSymbol = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        let favorite = UINavigationController(rootViewController: HomeViewController())
        
        favorite.tabBarItem.image = favoriteSymbol
        favorite.tabBarItem.title = "Filmes Favoritos"
        
        let menu = UINavigationController(rootViewController: MenuViewController())
        let menuSymbol = UIImage(systemName: "text.justify", withConfiguration: symbolConfiguration)
        menu.tabBarItem.image = menuSymbol
        menu.tabBarItem.title = "Menu"
        
        
        
        self.setViewControllers([home, favorite, menu], animated: true)
    }
}

