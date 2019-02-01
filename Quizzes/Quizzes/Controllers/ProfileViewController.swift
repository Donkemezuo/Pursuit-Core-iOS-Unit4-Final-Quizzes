//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    var username: String?

    let profileView = ProfileView()
     private var imagepickerVC:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        self.view.addSubview(profileView)
        setUpAlertController()
        self.profileView.imageButton.addTarget(self, action: #selector(setProfilePicture), for: .touchUpInside)
       
        
}
    
    @objc func setProfilePicture(){
        imagepickerVC = UIImagePickerController()
        imagepickerVC.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        }
        present(imagepickerVC, animated: true, completion: nil)
        
    }

    func setUpAlertController(){
        let alertController = UIAlertController(title: "Please enter your user name", message: "No space allowed or special characters", preferredStyle: .alert)
        alertController.addTextField { (textfield) in
            textfield.font = UIFont.boldSystemFont(ofSize: 20)
            textfield.layer.cornerRadius = 10.0
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alert: UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        let submit = UIAlertAction(title: "Submit", style: .default) { (alert) in
            guard let userName = alertController.textFields?.first?.text else {
                return
            }
            self.profileView.userNameLabel.text = userName
        }
        alertController.addAction(cancel)
        alertController.addAction(submit)
        present(alertController, animated: true, completion: nil)
    }
    
  
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileView.imageButton.setBackgroundImage(image, for: .normal)
        } else {
            print("No image")
        }
        dismiss(animated: true, completion: nil)
    }
}
