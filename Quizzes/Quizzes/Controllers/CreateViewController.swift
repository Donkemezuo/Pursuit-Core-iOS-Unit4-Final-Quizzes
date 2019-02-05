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
    var id = 51
    var createButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(createQuizView)
        createQuizView.textField.delegate = self
        createQuizView.textViewFirst.delegate = self
        createQuizView.textFieldSecond.delegate = self
        
        setupNavBarItems()
    }
    private func setupNavBarItems(){
        createButton =  UIBarButtonItem.init(title: "Create", style: .plain, target: self, action: #selector(createButtonClicked))
        navigationItem.rightBarButtonItem = createButton
        createButton.isEnabled = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
    }
    @objc func createButtonClicked(){
        if (createQuizView.textField.text?.isEmpty)! {
            fillsRequireFilling(title: "Quiz title")
        }
        
        if createQuizView.textViewFirst.text.isEmpty {
            fillsRequireFilling(title: "First quiz fact")
        }
        
        if createQuizView.textFieldSecond.text.isEmpty {
            fillsRequireFilling(title: "Second quiz fact")
        }
        
        if (createQuizView.textField.text?.isEmpty)! || createQuizView.textFieldSecond.text.isEmpty || createQuizView.textViewFirst.text.isEmpty {
            AtleastOneRequiredFilling()
        } else {
            let facts = [createQuizView.textViewFirst.text, createQuizView.textFieldSecond.text]
             guard let userName = UserDefaults.standard.string(forKey: userDefaultKeys.DefaultSearchKey) else {return}
            
            let quizCreatedByUser = Quiz.init(facts: facts as! [String], id: String(id), quizTitle: createQuizView.textField.text!, userName:userName)
            QuizModel.save(Quiz: quizCreatedByUser)
            savingStatusSuccess()
            
        }
  
    }

    private func fillsRequireFilling(title: String){
        let alert = UIAlertController(title: "", message: "\(title) is empty. All fields require to be filled", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .cancel) { (alert: UIAlertAction) in
        }
        alert.addAction(okay)
        present(alert, animated: true , completion: nil)

    }
    
    private func AtleastOneRequiredFilling(){
        let alert = UIAlertController(title: "", message: "Atleast one field require filling", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .cancel) { (alert: UIAlertAction) in
        }
        alert.addAction(okay)
        present(alert, animated: true , completion: nil)
    }
    
    
    
    private func savingStatusSuccess(){
        let alert = UIAlertController(title: "", message: "Successfully Created Quiz", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Done", style: .default) { (alert: UIAlertAction) in
        }
        alert.addAction(okay)
        present(alert, animated: true , completion: nil)
    }
    
    private func savingStatusFailed(){
        let alert = UIAlertController(title: "", message: "This quiz already exist", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Canel", style: .default) { (alert: UIAlertAction) in
        }
        alert.addAction(okay)
        present(alert, animated: true , completion: nil)
    }
    @objc func cancelButtonPressed(){
       

    }
}

extension CreateViewController: UITextViewDelegate, UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        createButton.isEnabled = true
        textField.becomeFirstResponder()
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
