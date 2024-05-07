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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
