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
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = quizView.collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCollectionViewCell else {return UICollectionViewCell()}
            cell.delegate = self
            cell.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        return cell
    }
    
    
}


