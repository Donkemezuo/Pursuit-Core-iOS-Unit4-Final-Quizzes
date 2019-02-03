//
//  DetailedViewController.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var quiz: String!
    
    let detailView = DetailView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        self.view.backgroundColor = UIColor.green.withAlphaComponent(1.0)
        
        detailView.collectionView.delegate = self
        detailView.collectionView.dataSource = self
    }
    init(quiz: String){
        super.init(nibName: nil, bundle: nil)
        self.quiz = quiz
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension DetailedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
guard let cell = detailView.collectionView.dequeueReusableCell(withReuseIdentifier: "DetailViewCell", for: indexPath) as? DetailViewCollectionViewCell else {return UICollectionViewCell()}
    cell.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        cell.firstFactTextView.text = "Raymond The legend"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! DetailViewCollectionViewCell
        cell.flipFacts()
        
    }
    

}

