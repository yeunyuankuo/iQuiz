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
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    var subject = ""
    var btn1 = false
    var btn2 = false
    var btn3 = false
    var btn4 = false
    var totalGuess = 0
    var totalQuestion = 0
    var right = 0
    var theme : Theme!
    
    func buttonPressed() {
        btn1 = false
        btn2 = false
        btn3 = false
        btn4 = false
        button1.backgroundColor = UIColor.gray
        button2.backgroundColor = UIColor.gray
        button3.backgroundColor = UIColor.gray
        button4.backgroundColor = UIColor.gray
    }
    
    @IBAction func button1(_ sender: Any) {
        btn1 = true
        buttonPressed()
        button1.backgroundColor = UIColor(red: 250.0/255.0, green: 128.0/255.0, blue: 114.0/255.0, alpha: 1.0)
    }
    
    @IBAction func button2(_ sender: Any) {
        btn2 = true
        buttonPressed()
        button2.backgroundColor = UIColor(red: 250.0/255.0, green: 128.0/255.0, blue: 114.0/255.0, alpha: 1.0)
    }
    
    @IBAction func button3(_ sender: Any) {
        btn3 = true
        buttonPressed()
        button3.backgroundColor = UIColor(red: 250.0/255.0, green: 128.0/255.0, blue: 114.0/255.0, alpha: 1.0)
    }
    
    @IBAction func button4(_ sender: Any) {
        btn4 = true
        buttonPressed()
        button4.backgroundColor = UIColor(red: 250.0/255.0, green: 128.0/255.0, blue: 114.0/255.0, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //questionSubject!.text! = subject
//        questionTitle.text = theme!.questions[totalGuess].text
//        button1.setTitle(theme!.questions[totalGuess].choices[0], for: UIControlState.normal)
//        button2.setTitle(theme!.questions[totalGuess].choices[1], for: UIControlState.normal)
//        button3.setTitle(theme!.questions[totalGuess].choices[2], for: UIControlState.normal)
//        button4.setTitle(theme!.questions[totalGuess].choices[3], for: UIControlState.normal)
        questionTitle.text = "This is an example question"
        button1.setTitle("exampleBtn1", for: UIControlState.normal)
        button2.setTitle("exampleBtn2", for: UIControlState.normal)
        button3.setTitle("exampleBtn3", for: UIControlState.normal)
        button4.setTitle("exampleBtn4", for: UIControlState.normal)
    }

    @IBAction func SubmitButton(_ sender: Any) {
        if (btn1 || btn2 || btn3 || btn4) {
            let AnswerPage = self.storyboard?.instantiateViewController(withIdentifier: "AnswerVC") as! AnswerViewController
            //AnswerPage.subjectTitle = subject
            AnswerPage.subjectTitle = "exampleSubject"
            //AnswerPage.q = theme!.questions[totalGuess].text
            AnswerPage.q = "exampleQ"
            /*if (btn1) {
                AnswerPage.guessed = theme!.questions[totalGuess].choices[0]
                if(theme!.questions[totalGuess].choices[0] == theme!.questions[totalGuess].answer) {
                    right += 1
                }
            }  else if (btn2) {
                AnswerPage.guessed = theme!.questions[totalGuess].choices[1]
                if(theme!.questions[totalGuess].choices[1] == theme!.questions[totalGuess].answer) {
                    right += 1
                }
            } else if (btn3) {
                AnswerPage.guessed = theme!.questions[totalGuess].choices[2]
                if(theme!.questions[totalGuess].choices[2] == theme!.questions[totalGuess].answer) {
                    right += 1
                }
            } else if (btn4) {
                AnswerPage.guessed = theme!.questions[totalGuess].choices[3]
                if(theme!.questions[totalGuess].choices[3] == theme!.questions[totalGuess].answer) {
                    right += 1
                }
            }*/
            totalGuess += 1
            AnswerPage.totalGuess = self.totalGuess
            //AnswerPage.totalQuestion = theme!.questions.count
            AnswerPage.totalQuestion = 1
            AnswerPage.theme = self.theme
            AnswerPage.right = self.right
            self.present(AnswerPage, animated: false, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
