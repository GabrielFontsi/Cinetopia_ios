//
//  ContaViewController.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 12/06/24.
//

import UIKit

class ContaViewController: UIViewController {
    
    var contaScreen: ContaScreen?
    var alert: Alert?
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func loadView() {
        self.contaScreen = ContaScreen()
        self.view = self.contaScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        alert = Alert(controller: self)
        self.contaScreen?.delegate(delegate: self)
        self.configImagePicker()
        
    }
    
    func configImagePicker(){
        imagePicker.delegate = self
        self.imagePicker.allowsEditing = false
    }
    

}

extension ContaViewController: ContaScreenProtocol {
    func actionEditPhotoButton() {
        print("botao clique")
        self.alert?.chooseImage(completion: { option in
            switch option {
            case .camera:
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    self.imagePicker.sourceType = .camera
                } else {
                    self.imagePicker.sourceType = .photoLibrary
                }
                self.present(self.imagePicker, animated: true)
            case .library:
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true)
            case .cancel:
                break
            }
        })
    }
    
    func actionLibriryButton() {
      
        
    }
    
    func actionCameraButton() {
        print("botao clique cameraaa")
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
