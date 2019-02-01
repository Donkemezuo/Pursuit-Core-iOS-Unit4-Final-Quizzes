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
        
        // Do any additional setup after loading the view.
    }
    
    private func setupNavBarItems(){
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Create", style: .plain, target: self, action: #selector(createButtonClicked))
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
    }
    
    @objc func createButtonClicked(){
        
    }
    
    @objc func cancelButtonPressed(){
        dismiss(animated: true, completion: nil)
       //present(QuizViewController(), animated: true, completion: nil)
    }
    

}
