//
//  QuizLogic.swift
//  Swift-Quiz
//
//  Created by Carlos Blandino on 5/21/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

struct QuizLogic {
    var totalResponses = 0
    var correctAnswer = ""
    var questions = [Question]()
    //termporary data structure
    let allQuestions = [
        Question(question: "Does @objc work with #selector()?", answer:"True"),
        Question(question: "Does .isEmpty need parenthesis?", answer: "False"),
        Question(question: "A button has a .layer property?", answer: "True"),
        Question(question: "The .layer property has a .cornerRadius?", answer: "True"),
        Question(question: "Is .scheduledTimer part of Timer class?", answer: "True"),
        Question(question: "The UIProgressView is necessary to create a progress bar", answer: "True"),
        
        
    ]
/*
     current title of the buttons true or false which is acutally current answer
    need to check the answer from button against stored answer and return it
    true to false return is used in answer button pressed for view response
 */
    mutating func checkAnswer(currentTitle: String) -> Bool {
        
    //totalResponses is used in calculating progrogress bar progression
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
/*
    helper function that access a random question and removes it
    from the array to avoid reselcting it , also needs to update
    all required variable to reflect question and answer
 */
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
    
    //calculation to for the progress bar, need to manipulate quizlogic data
    func getProgress() -> Float {
        
        return Float(totalResponses) / Float(allQuestions.count)
    }
/*
     need to get the question for the view to show
     so a string return in required, the question
     is at random, aslong as its not empty otherwise
     question bank needs to get reset
     
*/
    mutating func getQuestion() -> String {
        
   
        if questions.isEmpty {
            
            totalResponses = 0
            
            questions = allQuestions

            return getRandom()
            
        } else {
            
            return getRandom()
        }
        
    }
}
