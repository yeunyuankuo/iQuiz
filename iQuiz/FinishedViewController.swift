//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Jessie Kuo on 12/11/2017.
//  Copyright © 2017 appcat. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var performance: UILabel!
    @IBOutlet weak var score: UILabel!
    
    var subjectTitle = ""
    var right = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subject.text = subjectTitle
        score.text = "\(right) questions right out of \(total)!"
        if right == total{
            self.performance!.text! = "Perfect!"
        } else if right > (total/2) {
            self.performance!.text! = "Almost!"
        } else {
            self.performance!.text! = "Keep trying!"
        }
    }

    @IBAction func NextButton(_ sender: AnyObject) {
        let MainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        self.present(MainVC, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
