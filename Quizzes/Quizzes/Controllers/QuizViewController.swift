//
//  ViewController.swift
//  Quizzes
//
//  Created by Alex Paul on 1/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    let quizView = QuizView()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    view.addSubview(quizView)
    
  }


}


