//
//  DetailViewCollectionViewCell.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewCollectionViewCell: UICollectionViewCell {
    
    public lazy var firstFactTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return textView
        
    }()


    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setConstrains()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setConstrains(){
        addSubview(firstFactTextView)
        firstFactTextView.translatesAutoresizingMaskIntoConstraints = false
        firstFactTextView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        firstFactTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        firstFactTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        firstFactTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
    }
    
    public func flipFacts(cell: DetailViewCollectionViewCell, fact: String) {
        
        UIView.transition(with: firstFactTextView, duration: 1.0, options: [.transitionFlipFromRight], animations: {
        cell.firstFactTextView.text = fact
        })

}
}
