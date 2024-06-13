//
//  ContaViewController.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 12/06/24.
//

import UIKit

class ContaViewController: UIViewController {
    
    var contaScreen: ContaScreen?
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func loadView() {
        self.contaScreen = ContaScreen()
        self.view = self.contaScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.contaScreen?.delegate(delegate: self)
        self.configImagePicker()
        
    }
    
    func configImagePicker(){
        imagePicker.delegate = self
    }
    

}

extension ContaViewController: ContaScreenProtocol {
    func actionLibriryButton() {
        print("botao clique")
        
        self.imagePicker.allowsEditing = false
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
        } else {
            imagePicker.sourceType = .camera
        }
        
        present(imagePicker, animated: true)
    }
    
    func actionCameraButton() {
        print("botao clique cameraaa")
        self.imagePicker.allowsEditing = false
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        present(imagePicker, animated: true)
    }
    
    
}

extension ContaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.contaScreen?.imagePerfilUIimageView.image = image
        }
        
        picker.dismiss(animated: true)
    }
    
}
