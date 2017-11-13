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
    //var subjectTitle = ""
    var subjectTitle = "exampleSubjectTitle"
    //var q = ""
    var q = "exampleQuestion"
    //var a = ""
    var a = "exampleAnswer"
    var ifCorrect = ""
    var guessed = ""
    var right = 0
    var totalGuess = 0
    var totalQuestion = 0
    var theme: Theme!
    
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

    @IBAction func NextButton(_ sender: Any) {
        if(totalGuess < totalQuestion) {
            let QuestionVC = self.storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionViewController
            QuestionVC.totalGuess = self.totalGuess
            QuestionVC.totalQuestion = theme!.questions.count
            QuestionVC.theme = self.theme
            QuestionVC.subject = self.subjectTitle
            QuestionVC.right = self.right
            self.present(QuestionVC, animated: false, completion: nil)
        } else {
            let FinishedVC = self.storyboard?.instantiateViewController(withIdentifier: "FinishedVC") as! FinishedViewController
            FinishedVC.subjectTitle = self.subjectTitle
            FinishedVC.right = self.right
            FinishedVC.total = self.totalQuestion
            self.present(FinishedVC, animated: false, completion: nil)
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        let MainVC = self.storyboard?.instantiateViewController(withIdentifier: "main") as! ViewController
        self.present(MainVC, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
