//
//  ViewController.swift
//  Swift-Quiz
//
//  Created by Carlos Blandino on 5/19/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
   
    var correctAnswer = ""
    
    var quiz = Question()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestions()
        //at start up I needed to set the progressbar to starting position
        progressBar.progress = 0
        //I need the first random question to appear
        updateQuestion()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //temporarily setup some local variable to allow checking of
        //correct answer
        
        checkAnswer(currentTitle: sender.currentTitle!)
        
        //bringing up the next question after user answers
        updateQuestion()
    }
    
    func addQuestions() {
        quiz.addQuestion(question: "Four + Two is equal to Six", ans: "True")
        quiz.addQuestion(question: "Five - Three is greater than One", ans: "True")
        quiz.addQuestion(question: "Three + Eight is less than Ten", ans: "False")
    }
    
    func checkAnswer(currentTitle: String) {
        
        //this is buttonPressed helper function
        //that will verify
        //if correct button was pressed
        
        let userAnswer = currentTitle
        let actualAnswer = correctAnswer
        
        if userAnswer == actualAnswer {
            print("Correct")
        } else {
            print("Wrong")
        }
    }

    func updateQuestion() {
        //since the quiz is being reduce by the current
        //question we need to first check for an empty
        //array
        
        if quiz.questions.isEmpty {
    
        viewDidLoad()
        //we randomly select the next question if the
        //array is not empty and assign its answer to the
        //temp global variable correctAnswer
        //and afterwards remove element form the array
        //so we don't get a duplicate or predictable question
        } else {
            let strElementKey = quiz.questions.randomElement()
            let index = strElementKey!.key
            questionLabel.text = index
            correctAnswer = strElementKey?.value ?? ""
            quiz.questions.remove(at: quiz.questions.index(forKey: index)!)
        }
    }
    
}

