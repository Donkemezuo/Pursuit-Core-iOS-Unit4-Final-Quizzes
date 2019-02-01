//
//  QuizCollectionViewCell.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

protocol AlertControllerDelegate: AnyObject {
    func presentAlertControllerAlertSheet(view: UIAlertController)
}

class QuizCollectionViewCell: UICollectionViewCell {
    weak var delegate: AlertControllerDelegate! = nil
    
    public lazy var button: UIButton = {
        let OptionsButton = UIButton()
            OptionsButton.setTitle("...", for:.normal)
            OptionsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        OptionsButton.addTarget(self, action: #selector(alertController), for: .touchUpInside)
        
        return OptionsButton
        
    }()
    
    
    public lazy var label: UILabel = {
        let quizTitle = UILabel()
        quizTitle.font = UIFont.boldSystemFont(ofSize: 30)
        quizTitle.numberOfLines = 0
        quizTitle.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        quizTitle.text = "Yes we made it here son"
        return quizTitle
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setCollectionViewCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setCollectionViewCell(){
        addSubview(button)
        addSubview(label)
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 260).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 70).isActive = true
        
        
    }
    
    @objc func alertController(){
        let alert = UIAlertController(title: "Options", message: "Select an option", preferredStyle: .actionSheet)
        let delete = UIAlertAction.init(title: "Delete", style: .destructive) { (alert: UIAlertAction) in
            
        }
        
        let cancel = UIAlertAction.init(title: "Cancel", style: .cancel) { (alert: UIAlertAction) in
            
        }
        
        alert.addAction(delete)
        alert.addAction(cancel)
        delegate.presentAlertControllerAlertSheet(view: alert)
        
    }
    
}