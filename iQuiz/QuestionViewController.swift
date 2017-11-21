//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Jessie Kuo on 12/11/2017.
//  Copyright © 2017 appcat. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionSubject: UILabel!
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var button1: UIButton!
    var btn1 = false
    @IBOutlet weak var button2: UIButton!
    var btn2 = false
    @IBOutlet weak var button3: UIButton!
    var btn3 = false
    @IBOutlet weak var button4: UIButton!
    var btn4 = false
    @IBOutlet weak var submitBtn: UIButton!
    var subject = ""
    
    var themes : Theme!
    var totalGuess = 0
    var totalQuestion = 0
    var right = 0
    
    @IBAction func button1(_ sender: Any) {
        buttonPressed()
        btn1 = true
        button1.backgroundColor = UIColor(red: 250.0/255.0, green: 128.0/255.0, blue: 114.0/255.0, alpha: 1.0)
    }
    
    @IBAction func button2(_ sender: Any) {
        
        buttonPressed()
        btn2 = true
        button2.backgroundColor = UIColor(red: 250.0/255.0, green: 128.0/255.0, blue: 114.0/255.0, alpha: 1.0)
    }
    
    @IBAction func button3(_ sender: Any) {
        
        buttonPressed()
        btn3 = true
        button3.backgroundColor = UIColor(red: 250.0/255.0, green: 128.0/255.0, blue: 114.0/255.0, alpha: 1.0)
    }
    
    @IBAction func button4(_ sender: Any) {
        
        buttonPressed()
        btn4 = true
        button4.backgroundColor = UIColor(red: 250.0/255.0, green: 128.0/255.0, blue: 114.0/255.0, alpha: 1.0)
    }
    
    func buttonPressed() {
        button1.backgroundColor = UIColor.gray
        btn1 = false
        button2.backgroundColor = UIColor.gray
        btn2 = false
        button3.backgroundColor = UIColor.gray
        btn3 = false
        button4.backgroundColor = UIColor.gray
        btn4 = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionSubject!.text! = subject
        if (themes != nil) {
            questionTitle.text = themes!.questions[totalGuess].text
            button1.setTitle(themes!.questions[totalGuess].choices[0], for: UIControlState.normal)
            button2.setTitle(themes!.questions[totalGuess].choices[1], for: UIControlState.normal)
            button3.setTitle(themes!.questions[totalGuess].choices[2], for: UIControlState.normal)
            button4.setTitle(themes!.questions[totalGuess].choices[3], for: UIControlState.normal)
        } else {
            print("Theme is nil")
        }
    }

    @IBAction func SubmitButton(_ sender: Any) {
        print("I'm in submit button")
        if (btn1 || btn2 || btn3 || btn4) {
            print("I'm in submit button if ")
            let AnswerPage = self.storyboard?.instantiateViewController(withIdentifier: "AnswerVC") as! AnswerViewController
            AnswerPage.subjectTitle = subject
            AnswerPage.q = themes!.questions[totalGuess].text
            AnswerPage.a = themes!.questions[totalGuess].answer
            if (btn1) {
                AnswerPage.guessed = themes!.questions[totalGuess].choices[0]
                if(themes!.questions[totalGuess].choices[0] == themes!.questions[totalGuess].answer) {
                    right += 1
                }
            }  else if (btn2) {
                AnswerPage.guessed = themes!.questions[totalGuess].choices[1]
                if(themes!.questions[totalGuess].choices[1] == themes!.questions[totalGuess].answer) {
                    right += 1
                }
            } else if (btn3) {
                AnswerPage.guessed = themes!.questions[totalGuess].choices[2]
                if(themes!.questions[totalGuess].choices[2] == themes!.questions[totalGuess].answer) {
                    right += 1
                }
            } else if (btn4) {
                AnswerPage.guessed = themes!.questions[totalGuess].choices[3]
                if(themes!.questions[totalGuess].choices[3] == themes!.questions[totalGuess].answer) {
                    right += 1
                }
            }
            totalGuess += 1
            AnswerPage.totalGuess = self.totalGuess
            AnswerPage.totalQuestion = themes!.questions.count
            AnswerPage.themes = self.themes
            AnswerPage.right = self.right
            self.present(AnswerPage, animated: false, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
