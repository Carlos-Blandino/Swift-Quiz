//
//  QuizLogic.swift
//  Swift-Quiz
//
//  Created by Carlos Blandino on 5/21/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import Foundation
import UIKit

struct QuizLogic {
    var totalResponses = 0
    var totalNumberOfQuestion = 0
    var correctAnswer = ""
    var questions = [Question]()
    let allQuestions = [
        Question(question: "Four + Two is equal to Six", answer:"True"),
        Question(question: "Five - Three is greater than One", answer: "True"),
        Question(question: "Three + Eight is less than Ten", answer: "False")
    ]
    
    mutating func checkAnswer(currentTitle: String) -> Bool {
        
 
        totalResponses += 1
        
        var totalCorrectAnswers = 0
        
        let userAnswer = currentTitle
        let actualAnswer = correctAnswer
        
        if userAnswer == actualAnswer {
            totalCorrectAnswers += 1
            return true
        } else {
            return false
        }
        
    }
    
    
    mutating func getRandom() -> String {
        var strElementKey = Question()
        var questionResult = ""
        let randomIndex = Int.random(in: 0..<questions.count)
        strElementKey = questions[randomIndex]
        questionResult = strElementKey.question
        
        correctAnswer = strElementKey.answer

        questions.remove(at: randomIndex)
        return questionResult
    }
    
    
    
    mutating func getQuestion() -> String {
        
        totalNumberOfQuestion = allQuestions.count


        if questions.isEmpty {
            
            totalResponses = 0
            questions = allQuestions

            return getRandom()
        } else {

            print(questions.count)
          
            return getRandom()
        }
        
    }
}
