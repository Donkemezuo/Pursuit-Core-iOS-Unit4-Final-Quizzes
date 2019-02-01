//
//  CreateQuizView.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateQuizView: UIView {

    public lazy var textField: UITextField = {
        var textField = UITextField()
        textField.textColor = .red
        textField.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.placeholder = " Enter the quiz title"
        textField.layer.cornerRadius = 10.0
        
        return textField
        
    }()
    
    public lazy var textViewFirst: UITextView = {
        var firstQuizFactTextView = UITextView()
            firstQuizFactTextView.backgroundColor = UIColor.red.withAlphaComponent(0.2)
            firstQuizFactTextView.font = UIFont.boldSystemFont(ofSize: 20)
            firstQuizFactTextView.text = "Enter first quiz facts"
            firstQuizFactTextView.textColor = UIColor.lightGray
            firstQuizFactTextView.layer.cornerRadius = 10.0
        return firstQuizFactTextView
    }()
    
    public lazy var textFieldSecond: UITextView = {
        var secondQuizFactTextView = UITextView()
        secondQuizFactTextView.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        secondQuizFactTextView.font = UIFont.boldSystemFont(ofSize: 20)
        secondQuizFactTextView.text = "Enter second quiz facts"
        secondQuizFactTextView.textColor = UIColor.lightGray
        secondQuizFactTextView.layer.cornerRadius = 10.0
        
        return secondQuizFactTextView
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
    
    private func setConstrains() {
        addSubview(textField)
        addSubview(textViewFirst)
        addSubview(textFieldSecond)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        textField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.07).isActive = true
        
        textViewFirst.translatesAutoresizingMaskIntoConstraints = false
        textViewFirst.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        textViewFirst.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        textViewFirst.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        textViewFirst.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        textFieldSecond.translatesAutoresizingMaskIntoConstraints = false
        textFieldSecond.topAnchor.constraint(equalTo: textViewFirst.bottomAnchor, constant: 20).isActive = true
        textFieldSecond.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        textFieldSecond.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        textFieldSecond.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        
        
        
    }

}
