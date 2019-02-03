//
//  SearchView.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit


class SearchView: UIView {
  
    
    public lazy var collectionView: UICollectionView = {
        let cellLayout = UICollectionViewFlowLayout()
        cellLayout.scrollDirection = .vertical
        cellLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        cellLayout.itemSize = CGSize.init(width: 350, height: 350)
        let searchQuizCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
        searchQuizCollectionView.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        return searchQuizCollectionView
        
}()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
        self.collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchQuizCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
    
    private func commonInt(){
        setConstrains()
    }
    private func setConstrains(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo:topAnchor, constant: 30).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    }
    
    
    }

