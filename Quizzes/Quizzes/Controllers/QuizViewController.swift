//
//  ViewController.swift
//  Quizzes
//
//  Created by Alex Paul on 1/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, QuizCollectionViewAlertDelegate {
    func deleteQuiz(index: Int) {
         guard let userName = UserDefaults.standard.string(forKey: userDefaultKeys.DefaultSearchKey) else {return}
        let quizes = QuizModel.getSavedQuizzez(username: userName)
        QuizModel.delete(savedQuiz:quizes, index: index)
        self.quizView.collectionView.reloadData()
    }
    let quizView = QuizView()
    var quizzez = [Quiz]() {
        didSet {
            DispatchQueue.main.async {
                self.quizView.collectionView.reloadData()
                self.getData()
                guard let userName = UserDefaults.standard.string(forKey: userDefaultKeys.DefaultSearchKey) else {return}
                self.navigationItem.title = "\(userName) has \(self.quizzez.count) Quizzes"
            }
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.view.addSubview(quizView)
    quizView.collectionView.dataSource = self
    quizView.collectionView.delegate = self
    getData()
    print(DataPersistenceManager.documentsDirectory())
  }
    
    func getData(){
         guard let userName = UserDefaults.standard.string(forKey: userDefaultKeys.DefaultSearchKey) else {return}
        quizzez = QuizModel.getSavedQuizzez(username: userName)
    }
    
func presentAlertControllerAlertSheet(view: UIAlertController) {
        self.present(view, animated: true, completion: nil)
    }
}
extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizzez.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = quizView.collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCollectionViewCell else {return UICollectionViewCell()}
            cell.delegate = self
            cell.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        let quiz = quizzez[indexPath.row]
        cell.label.text = quiz.quizTitle
        cell.button.tag = indexPath.row
        cell.layer.borderWidth = 4
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let quizz = quizzez[indexPath.row]
        let detailVC = DetailedViewController(quiz: quizz)
    self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}


