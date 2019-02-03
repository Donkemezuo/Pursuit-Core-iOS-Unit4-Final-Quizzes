//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    let createQuizView = CreateQuizView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(createQuizView)
        setupNavBarItems()
    }
    
    private func setupNavBarItems(){
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Create", style: .plain, target: self, action: #selector(createButtonClicked))
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
    }
    
    @objc func createButtonClicked(){
        
        print(self.createQuizView.textField.text)
        print(self.createQuizView.textFieldSecond.text)
        print(self.createQuizView.textViewFirst.text)
        
        if self.createQuizView.textField.text == nil && self.createQuizView.textViewFirst.text == nil && self.createQuizView.textFieldSecond.text == nil {
            
            let alert = UIAlertController(title: "", message: "All field must be filled", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel) { (alert: UIAlertAction) in
            }
            alert.addAction(okay)
            present(alert, animated: true , completion: nil)
            
        } else {
            
        }
    }
        
    
        
    
    
    
    @objc func cancelButtonPressed(){
        dismiss(animated: true, completion: nil)
    }
    
  
    
}
