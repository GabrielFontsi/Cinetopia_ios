//
//  ContaViewController.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 12/06/24.
//

import UIKit

class ContaViewController: UIViewController {
    
    var contaScreen: ContaScreen?
    
    override func loadView() {
        self.contaScreen = ContaScreen()
        self.view = self.contaScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
