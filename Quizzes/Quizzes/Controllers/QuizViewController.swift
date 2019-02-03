//
//  ViewController.swift
//  Quizzes
//
//  Created by Alex Paul on 1/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, AlertControllerDelegate {
    
    let quizView = QuizView()
    
    let dummyQuizes = ["Jevon","Martins","Ibraheem","Jessica","Brian","Kamil","Angela","Aly","NSBE","Nigeria","Yeah","Footbal","League","Sexy","Blown","Exposed","You never did"]

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.view.addSubview(quizView)
    quizView.collectionView.dataSource = self
    quizView.collectionView.delegate = self
    
  }
    func presentAlertControllerAlertSheet(view: UIAlertController) {
        self.present(view, animated: true, completion: nil)
    }
}
extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyQuizes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = quizView.collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCollectionViewCell else {return UICollectionViewCell()}
            cell.delegate = self
            cell.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        let quiz = dummyQuizes[indexPath.row]
        cell.label.text = quiz
        cell.layer.borderWidth = 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let quizz = dummyQuizes[indexPath.row]
        let detailVC = DetailedViewController(quiz: quizz)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}


