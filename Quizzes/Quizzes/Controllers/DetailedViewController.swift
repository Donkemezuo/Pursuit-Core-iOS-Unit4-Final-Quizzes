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
        self.view.backgroundColor = UIColor.green.withAlphaComponent(0.2)
    }
    
    init(quiz: String){
        super.init(nibName: nil, bundle: nil)
        self.quiz = quiz
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

