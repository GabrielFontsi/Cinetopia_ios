//
//  SplashViewController.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 07/05/24.
//

import UIKit

class SplashViewController: UIViewController {
    
    var splashScreen: SplashScreen?
    
    override func loadView() {
        self.splashScreen = SplashScreen()
        self.view = self.splashScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.splashScreen?.delegate(delegate: self)
        
    }
}

extension SplashViewController: SplashScreenProtocol {
    func actionWelcomeButton() {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
}
