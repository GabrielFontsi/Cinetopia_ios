//
//  LoginViewController.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 07/05/24.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setHidesBackButton()
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.loginScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
    func setHidesBackButton(){
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
       self.loginScreen?.validTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension LoginViewController: LoginScreenProtocol {
    func actionLoginButton() {
        guard let login = self.loginScreen else {return}
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (usuario, error) in
            
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "dados incorretos, verifique e tente novamente")
            } else {
                if usuario == nil {
                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema insesperado, tente novamente mais tarde")
                } else {
                    let movieVC = TabBarViewController()
                    self.navigationController?.pushViewController(movieVC, animated: true)
                }
            }
        })
        
    }
    
    func actionRegisterButton() {
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
}


