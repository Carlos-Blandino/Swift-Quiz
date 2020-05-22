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
    var quizBrain = QuizLogic()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        changeButton(button: trueButton)
        changeButton(button: falseButton)
        
        progressBar.progress = 0
        
        updateQuestion()
        
    }
    
    func changeButton(button: UIButton) {
        button.layer.borderColor = CGColor.init(srgbRed: 200, green: 200, blue: 200, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        
        var ans = quizBrain.checkAnswer(currentTitle: sender.currentTitle!)
        if ans {
            sender.backgroundColor = .systemGreen
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateButton), userInfo: nil, repeats: false)
            updateQuestion()
        } else {
            
            sender.backgroundColor = .systemRed
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateButton), userInfo: nil, repeats: false)
            updateQuestion()
        }
        
        updateProgressBar()
        
    }
    
    @objc func updateButton() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
    func updateProgressBar() {
        
        progressBar.progress = Float(quizBrain.totalResponses) / Float(quizBrain.totalNumberOfQuestion)
        
    }
    func updateQuestion() {
        
        let updatedQuestion = quizBrain.getQuestion()
        questionLabel.text = updatedQuestion
    }
    
}

