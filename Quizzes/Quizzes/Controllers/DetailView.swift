//
//  DetailView.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var collectionView: UICollectionView = {
        
        let cellLayout = UICollectionViewFlowLayout()
        cellLayout.scrollDirection = .vertical
        cellLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        cellLayout.itemSize = CGSize.init(width: 190, height: 350)
        
        let detailedCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
            detailedCollectionView.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        
        
        return detailedCollectionView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
        self.collectionView.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: "DetailViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
    
    private func commonInt(){
        setConstrains()
        
    }
    
    func setConstrains() {
        addSubview(collectionView)
    
        collectionView.translatesAutoresizingMaskIntoConstraints = true
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        
    }
    

}
