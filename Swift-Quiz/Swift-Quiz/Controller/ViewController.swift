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
/*
     Quiz logic struct holds the functionality to manipulate the data
     and coltrolling the user interface(view) in this viewController
*/
    var quizBrain = QuizLogic()
    //view needs to set initialize the progress bar, and questions at minimum
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //setting everthing graphically in place starting with
        //the custom buttons
        changeButton(button: trueButton)
        changeButton(button: falseButton)
        
        progressBar.progress = 0
        
        updateQuestion()
        
    }
    //helper function to customize the view's buttons
    func changeButton(button: UIButton) {
        button.layer.borderColor = CGColor.init(srgbRed: 200, green: 200, blue: 200, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
    }
    //view needs to know if the aswer is correct to properly affect the view
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let ans = quizBrain.checkAnswer(currentTitle: sender.currentTitle!)
        //when ans is true it will display a green color on clicked button
        //and display red if false (incorrect answer)
        //after every button click need to also update question on display
        //and update the progress
        if ans {
            sender.backgroundColor = .systemGreen
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateButton), userInfo: nil, repeats: false)
            updateProgressBar()
            updateQuestion()
            
        } else {
            sender.backgroundColor = .systemRed
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateButton), userInfo: nil, repeats: false)
            updateProgressBar()
            updateQuestion()
            
        }
        
    }
    //view needs to update the button
    //helper function that is called upon after the scheduledTimer in answerButtonPressed func is done
    @objc func updateButton() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
    //veiw needs to update the progress bar
    func updateProgressBar() {
        //the progress bar uses a 0 to 1 scale to adjust the progress, basically a percentage as a
        //result of a fraction
        progressBar.progress = Float(quizBrain.totalResponses) / Float(quizBrain.allQuestions.count)
        
    }
    //view needs to update the question label
    func updateQuestion() {
        
        let updatedQuestion = quizBrain.getQuestion()
        
        questionLabel.text = updatedQuestion
    }
    
}

