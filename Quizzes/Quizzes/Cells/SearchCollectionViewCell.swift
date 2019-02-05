//
//  SearchCollectionViewCell.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

protocol NotificationDelegate: AnyObject {
    func didSaveQuiz()
}

class SearchCollectionViewCell: UICollectionViewCell {
    var delegate: NotificationDelegate?
    var quizDetails:QuizQuestionAndAnswers!
    
    public lazy var addIcon: UIButton = {
        let addButton = UIButton()
        addButton.setImage(UIImage.init(named: "icons8-cross"), for: .normal)
        addButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        return addButton
        
    }()
    public lazy var label: UILabel = {
        let title = UILabel()
        title.text = "This is the quiz title"
        title.font = UIFont.boldSystemFont(ofSize: 30)
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
        
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    @objc func save(){
        let selectedQuiz = Quiz.init(facts: self.quizDetails.facts, id: self.quizDetails.id, quizTitle: self.quizDetails.quizTitle)
        QuizModel.save(Quiz: selectedQuiz)
        delegate?.didSaveQuiz()
    }
    
    private func  setConstrains() {
        addSubview(addIcon)
        addSubview(label)
        
        addIcon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 20).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true 
        
        addIcon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        addIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250).isActive = true
        addIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
    }
}


