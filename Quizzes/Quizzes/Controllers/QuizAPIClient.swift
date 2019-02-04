//
//  QuizAPIClient.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizAPIClient {
    static func quiz(completionHandler: @escaping(Error?,[QuizQuestionAndAnswers]?) -> Void ){
        
        let quizEndpoint = "https://quizzes-9ff59.firebaseio.com/.json"
        NetworkHelper.shared.performDataTask(endpointURLString: quizEndpoint, httpMethod: "GET", httpBody: nil) { (error, data) in
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
            let quiz = try JSONDecoder().decode([QuizQuestionAndAnswers].self, from: data)
                    completionHandler(nil, quiz)
                } catch {
                completionHandler(error, nil)
                }
            }
        }
        
    }
}
