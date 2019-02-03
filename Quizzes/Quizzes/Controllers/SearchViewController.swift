//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchQuiz = SearchView()
    var quizzez = [QuizQuestionAndAnswers]() {
        didSet {
        DispatchQueue.main.async {
    self.searchQuiz.collectionView.reloadData()
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(searchQuiz)
        self.view.backgroundColor = .green
        searchQuiz.collectionView.delegate = self
        searchQuiz.collectionView.dataSource = self
        getQuizData()
        //saveButtonClicked()
    }
    private func getQuizData(){
        QuizAPIClient.quiz { (error, data) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                self.quizzez = data
                dump(self.quizzez)
            }
        }
    }
//
//    func saveButtonClicked(cell: SearchCollectionViewCell){
//           cell.addIcon.addTarget(self, action: #selector(saveQuiz), for: .touchUpInside)
//
//    }
//
//    @objc func saveQuiz(cell: SearchCollectionViewCell, index:Int){
//        let quiz = quizzez[index]
//        let savedQuiz = Quiz.init(facts: quiz.facts, id: quiz.id, quizTitle: quiz.quizTitle)
//        QuizModel.save(Quiz:savedQuiz)
//    }
    
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func selectedQuizDelegate(cell: UICollectionViewCell, indexPath: Int) {
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizzez.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchQuiz.collectionView.dequeueReusableCell(withReuseIdentifier: "SearchQuizCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        let quiz = quizzez[indexPath.row]
        cell.label.text = quiz.quizTitle
        cell.layer.borderWidth = 2
    
        return cell
    }
    
    
}
