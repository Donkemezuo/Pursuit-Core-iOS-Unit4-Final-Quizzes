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
        self.profileView.imageButton.addTarget(self, action: #selector(setImageAlertController), for: .touchUpInside)
        userDefault()
}
        @objc func setProfilePicture(){
        imagepickerVC = UIImagePickerController()
        imagepickerVC.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        }
        present(imagepickerVC, animated: true, completion: nil)
        
    }
    
        @objc func setImageAlertController(){
        let alert = UIAlertController(title: "Options", message: "", preferredStyle: .actionSheet)
        let PhotoLibrary = UIAlertAction(title: "Photo Library", style: .default) { (alert: UIAlertAction) in
            self.setProfilePicture()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alert) in
            self.dismiss(animated: true , completion: nil)
        }
        alert.addAction(PhotoLibrary)
        alert.addAction(cancel)
         present(alert, animated: true, completion: nil)
            if let image = self.profileView.imageButton.imageView?.image {
                guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
                UserDefaults.standard.set(imageData, forKey: userDefaultKeys.DefaultImageKey)

            }
            
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
            UserDefaults.standard.set(userName, forKey: userDefaultKeys.DefaultSearchKey)
             self.setupNotification(name: userName)
        
        }
        alertController.addAction(cancel)
        alertController.addAction(submit)
        present(alertController, animated: true, completion: nil)
    }

        func setupNotification(name: String){
             let alertController = UIAlertController(title: "", message: "Hi \(name) thank you for logging in", preferredStyle: .alert)
            let done = UIAlertAction(title: "Okay", style: .cancel) { (alert: UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
        }
            alertController.addAction(done)
            present(alertController, animated: true, completion: nil)
        }
        private func userDefault(){
            if let defaultUsername = UserDefaults.standard.object(forKey: userDefaultKeys.DefaultSearchKey) as? String {
                self.profileView.imageButton.addTarget(self, action: #selector(setImageAlertController), for: .touchUpInside)
                userImageDefault()
                self.profileView.userNameLabel.text = defaultUsername
            } else {
                setUpAlertController()
                
            }
        }
        
        private func userImageDefault(){
        let image = UserDefaults.standard.object(forKey: userDefaultKeys.DefaultImageKey) as? NSData
            if let imageData = image as Data? {
                self.profileView.imageButton.setBackgroundImage(UIImage(data: imageData), for: .normal)
            }
                
            
        }
    }
    extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileView.imageButton.setBackgroundImage(image, for: .normal)
            guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
            UserDefaults.standard.set(imageData, forKey: userDefaultKeys.DefaultImageKey)
        } else {
            print("No image")
        }
        dismiss(animated: true, completion: nil)
    }
}
