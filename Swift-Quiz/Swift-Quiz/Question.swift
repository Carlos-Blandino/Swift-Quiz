//
//  Question.swift
//  Swift-Quiz
//
//  Created by Carlos Blandino on 5/20/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import Foundation
struct Question {
    var questions = [String: String]()

    mutating func addQuestion(question: String, ans: String) {
        questions[question] = ans
    }
}
