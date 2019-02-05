//
//  QuizModel.swift
//  Quizzes
//
//  Created by Donkemezuo Raymond Tariladou on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizModel {
    private static let filename = "SavedQuizzes.plist"
    private static var savedQuizzes = [Quiz]()
    
    static func saveQuiz(){
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename:filename)
        do {
    let data = try PropertyListEncoder().encode(savedQuizzes)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("error encountered while encoding data")
        }
}
    static func getSavedQuizzez() -> [Quiz] {
        
let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
           
            if let data = FileManager.default.contents(atPath: path) {
                do {
        savedQuizzes = try PropertyListDecoder().decode([Quiz].self, from: data)
                } catch {
                    print("Property list decoding error: \(error)")

                }
            } else {
                   print("Data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return savedQuizzes
    }
    static func save(Quiz:Quiz){
        savedQuizzes.append(Quiz)
        saveQuiz()
    }
    static func delete(savedQuiz:Quiz ,index: Int){
        savedQuizzes.remove(at: index)
        saveQuiz()
    
    
}
}
