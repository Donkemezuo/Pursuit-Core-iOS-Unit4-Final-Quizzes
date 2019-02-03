//
//  ProfileView.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    public lazy var label: UILabel = {
        let label = UILabel()
        label.text = "EDIT PHOTO"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    public lazy var view: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
    
    public lazy var imageButton: UIButton = {
        let profileImageButton = UIButton()
        profileImageButton.setBackgroundImage(UIImage.init(named: "placeholder-image"), for: .normal)
        profileImageButton.backgroundColor = .green
        profileImageButton.layer.cornerRadius = 30
        profileImageButton.clipsToBounds = true
     
        return profileImageButton
        
    }()
    
    public lazy var userNameLabel: UILabel = {
        let username = UILabel()
        username.textColor = UIColor.blue.withAlphaComponent(0.2)
        username.textAlignment = .center
        username.font = UIFont.boldSystemFont(ofSize: 20)
        username.text = "@Alex"
        return username
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        commonInt()
    }
    
    private func commonInt(){
        setConstrains()
        
    }
    
 
    
    private func setConstrains(){
        addSubview(label)
        addSubview(view)
        addSubview(imageButton)
        addSubview(userNameLabel)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        view.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        imageButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 30).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        userNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.03).isActive = true
        
    }

}
