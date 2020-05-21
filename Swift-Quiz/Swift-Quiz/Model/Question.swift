//
//  Question.swift
//  Swift-Quiz
//
//  Created by Carlos Blandino on 5/20/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import Foundation
struct Question {
    var totalResponses = 0
    var questions = [String: String]()
    var totalNumberOfQuestion = 0
    var correctAnswer = ""
    mutating func addQuestion(question: String, ans: String) {
        questions[question] = ans
    }
}
