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
    
    var quiz = Question()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //change the style of the buttons programmatically
        changeButton(button: trueButton)
        changeButton(button: falseButton)
        //get the questions ready
        addQuestions()
        quiz.totalNumberOfQuestion = quiz.questions.count
        //at start up I needed to set the progressbar to starting position
        progressBar.progress = 0
        //need the first random question to appear
        updateQuestion()
        
    }
    
    func changeButton(button: UIButton) {
        button.layer.borderColor = CGColor.init(srgbRed: 200, green: 200, blue: 200, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //temporarily setup some local variable to allow checking of
        //correct answer
        
        checkAnswer(currentTitle: sender.currentTitle!, button:  sender)
        //  let incrementByOne = incrementProgressBar(forIncrement: 1)
        
        //bringing up the next question after user answers
        //updateQuestion()
    }
    
    func addQuestions() {
        quiz.addQuestion(question: "Four + Two is equal to Six", ans: "True")
        quiz.addQuestion(question: "Five - Three is greater than One", ans: "True")
        quiz.addQuestion(question: "Three + Eight is less than Ten", ans: "False")
    }
    
    func updateProgressBar() {
        progressBar.progress = Float(quiz.totalResponses) / Float(quiz.totalNumberOfQuestion)
    }
    
    func checkAnswer(currentTitle: String, button: UIButton) {
        
        //increment each time the question is answered
        quiz.totalResponses += 1
        
        var totalCorrectAnswers = 0
        //this is buttonPressed helper function
        //that will verify
        //if correct button was pressed
        
        let userAnswer = currentTitle
        let actualAnswer = quiz.correctAnswer
        
        if userAnswer == actualAnswer {
            totalCorrectAnswers += 1
            updateProgressBar()
            button.backgroundColor = .systemGreen
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        } else {
            updateProgressBar()
            button.backgroundColor = .systemRed
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
            
        }
        
    }
    
    @objc func updateQuestion() {
        //reset the buttons to original state
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        
        //since the quiz is being reduce by the current
        //question we need to first check for an empty
        //array
        
        if quiz.questions.isEmpty {
            //viewDidLoad resets the quiz
            viewDidLoad()
            quiz.totalResponses = 0
        } else {
            
            //we randomly select the next question if the
            let strElementKey = quiz.questions.randomElement()
            let index = strElementKey!.key
            questionLabel.text = index
            
            //array is not empty and assign its answer to the
            //temp global variable correctAnswer
            quiz.correctAnswer = strElementKey?.value ?? ""
            
            //so we don't get a duplicate or predictable question
            //and afterwards remove element form the array
            quiz.questions.remove(at: quiz.questions.index(forKey: index)!)
        }
        
    }
    
}

