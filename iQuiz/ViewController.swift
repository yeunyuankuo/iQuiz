//
//  ViewController.swift
//  iQuiz
//
//  Created by Jessie Kuo on 06/11/2017.
//  Copyright © 2017 appcat. All rights reserved.
//

import UIKit

struct fetchURL {
    static var URL = "http://tednewardsandbox.site44.com/questions.json"
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    let input = processJSON()
    //var themes = ["Mathematics", "Marvel Super Heroes", "Science"]
    //var descriptions = ["Learn more about Mathematics", "Learn more about Heroes", "Learn more about Science"]
    var images = ["40-math", "40-marvel", "40-science"]
    var subjects: [String] = []
    var subtitles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.input.HTTPRequest {
            self.subjects = self.input.titles
            self.subtitles = self.input.descriptions
            self.tableView.reloadData()
        }
        DispatchQueue.main.async { () -> Void in
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableCellView", for: indexPath as IndexPath) as! TableCellView
        cell.title.text = self.subjects[indexPath.row]
        cell.desc.text = self.subtitles[indexPath.row]
        cell.imageView?.image = UIImage(named: self.images[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.subjects.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let QuestionVC = self.storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionViewController
        QuestionVC.subject = subjects[indexPath.row]
        QuestionVC.totalQuestion = input.themes[indexPath.row].questions.count
        QuestionVC.themes = input.themes[indexPath.row]
        self.present(QuestionVC, animated: false, completion: nil)
    }
    
    func dismissAlert(alert: UIAlertAction!) {
        self.dismiss(animated: true)
    }
    
    @IBAction func settingPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Alert!", message: "Settings go here", preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel) {
            action in
        }
        alert.addAction(cancelAlert)
        alert.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = "Enter URL for JSON..."
        }
        let getAction : UIAlertAction = UIAlertAction(title: "Check!", style: .default, handler:{[weak self]
            (paramAction:UIAlertAction!) in
            if let textFields = alert.textFields {
                let textF = textFields as [UITextField]
                let entered = textF[0].text
                if entered != nil {
                    fetchURL.URL = entered!
                } else {
                    fetchURL.URL = "http://tednewardsandbox.site44.com/questions.json"
                }
                self!.tableView.reloadData()
            }
        })
        alert.addAction(getAction)
        self.present(alert, animated: true, completion: nil)
    }
}

