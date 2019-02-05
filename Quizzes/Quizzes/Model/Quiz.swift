//
//  Quiz.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Quiz: Codable {
    let facts:[String]
    let id: String
    let quizTitle: String
    let userName: String
}
