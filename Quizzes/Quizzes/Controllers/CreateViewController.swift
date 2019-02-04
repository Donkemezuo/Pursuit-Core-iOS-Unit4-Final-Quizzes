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
        guard let title = self.createQuizView.textField.text, let firstFact = self.createQuizView.textViewFirst.text, let secondFact = self.createQuizView.textFieldSecond.text else {return}
        
        let facts = [firstFact,secondFact]
        let quizCreatedByUser = Quiz.init(facts: facts, id: String(id), quizTitle: title)
        for quiz in QuizModel.getSavedQuizzez() {
            if quiz.id == quizCreatedByUser.id {
               savingStatusFailed()
            } else {
                QuizModel.save(Quiz: quizCreatedByUser)
                savingStatusSuccess()
                id += 1
            }
        }
    }
    
    func inputTextCheck(){
        guard let title = self.createQuizView.textField.text, let firstFact = self.createQuizView.textViewFirst.text, let secondFact = self.createQuizView.textFieldSecond.text else {return}
        switch title {
        case "":
            fillsRequireFilling()
        default:
            print("Tittle filled")
        }
        switch firstFact {
        case "":
            fillsRequireFilling()
        default:
            print("First fact is filled")
        }
        switch secondFact {
        case "":
            fillsRequireFilling()
        default:
            print("Second fact is filled")
        }
       
    }
    
    private func fillsRequireFilling(){
        let alert = UIAlertController(title: "", message: "Missing Text. All field must be filled", preferredStyle: .alert)
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
    dismiss(animated: true, completion: nil)
    }
}

extension CreateViewController: UITextViewDelegate, UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        inputTextCheck()
        return true
    }
    
}
