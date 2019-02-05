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
    }
    private func getQuizData(){
        QuizAPIClient.quiz { (error, data) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                self.quizzez = data
            }
        }
    }
}
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, NotificationDelegate {
    
    func didSaveQuiz() {
        
    let alert = UIAlertController(title: "", message: "Successfully saved quiz", preferredStyle: .alert)
          let okay = UIAlertAction.init(title: "Thank you", style: .default) { (alert: UIAlertAction) in
    
        }
        
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
        
    }
    
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return quizzez.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchQuiz.collectionView.dequeueReusableCell(withReuseIdentifier: "SearchQuizCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        let quiz = quizzez[indexPath.row]
        cell.label.text = quiz.quizTitle
        cell.layer.borderWidth = 2
        cell.delegate = self
        cell.quizDetails = quiz
    
        return cell
    }
    
    
}
