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
        textView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        return textView
        
    }()

    public lazy var secondFactTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.white
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
        firstFactTextView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        firstFactTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        firstFactTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        firstFactTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
    }
    
    public func flipFacts() {
        UIView.transition(from: firstFactTextView, to: firstFactTextView, duration: 1.0, options: [.transitionFlipFromRight], completion: nil)    }
    
    
    
    
}
