//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Jessie Kuo on 12/11/2017.
//  Copyright © 2017 appcat. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var correctness: UILabel!
    var guessed = ""
    var right = 0
    var totalGuess = 0
    var totalQuestion = 0
    var themes: Theme!
    var subjectTitle = ""
    var q = ""
    var a = ""
    var ifCorrect = ""

    @IBAction func NextButton(_ sender: Any) {
        if(totalGuess < totalQuestion) {
            let QuestionVC = self.storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionViewController
            QuestionVC.themes = self.themes
            QuestionVC.subject = self.subjectTitle
            QuestionVC.right = self.right
            QuestionVC.totalGuess = self.totalGuess
            QuestionVC.totalQuestion = themes!.questions.count
            self.present(QuestionVC, animated: false, completion: nil)
        } else {
            let FinishedVC = self.storyboard?.instantiateViewController(withIdentifier: "FinishedVC") as! FinishedViewController
            FinishedVC.right = self.right
            FinishedVC.subjectTitle = self.subjectTitle
            FinishedVC.total = self.totalQuestion
            self.present(FinishedVC, animated: false, completion: nil)
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        let MainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        self.present(MainVC, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subject.text = subjectTitle
        question.text = q
        answer.text = "Correct Answer: \(a)"
        if (guessed == a) {
            ifCorrect = "Yeah! you're right!"
        } else {
            ifCorrect = "No, \(guessed) is not the correct answer."
        }
        correctness.text = ifCorrect
    }
}
