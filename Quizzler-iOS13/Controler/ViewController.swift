//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var prograssBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    var quizBrain = QuizBrain()
    var questionIndex : Int = 0;
    var rightAnswers : Int = 0;
    var wrongAnswers : Int = 0;
    var progressPerQuestion : Float = Float(1/12);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prograssBar.progress = 0
        updateUI()
        
    }

    @IBAction func answerButtoonPresed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle // True or False
        
        
        if questionIndex < quizBrain.quiz.count-1{
            let actualAnswer = quizBrain.quiz[questionIndex].answer
            if userAnswer == actualAnswer{
                rightAnswers = rightAnswers + 1
                sender.backgroundColor = UIColor.green
            }
            else{
                wrongAnswers = wrongAnswers + 1
                sender.backgroundColor = UIColor.red
            }
                        
                Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
            questionIndex = questionIndex + 1
            
            
            
        }
        else{
            if questionIndex < quizBrain.quiz.count{
                let actualAnswer = quizBrain.quiz[questionIndex].answer
                if userAnswer == actualAnswer{
                    rightAnswers = rightAnswers + 1
                    sender.backgroundColor = UIColor.green
                }
                else{
                    wrongAnswers = wrongAnswers + 1
                    sender.backgroundColor = UIColor.red
                }
            }
            
            questionLable.text = "right answers: " + String(rightAnswers)  + " wrong answers: " + String(wrongAnswers)
            trueButton.backgroundColor = UIColor.clear
            falseButton.backgroundColor = UIColor.clear
            questionIndex = questionIndex + 1
            prograssBar.progress = 1
        }

    }
    
    @objc func updateUI(){
        questionLable.text = quizBrain.quiz[questionIndex].question
        prograssBar.progress = Float(questionIndex) / Float(quizBrain.quiz.count)
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

