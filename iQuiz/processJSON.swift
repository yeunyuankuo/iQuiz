//
//  processJSON.swift
//  iQuiz
//
//  Created by Jessie Kuo on 12/11/2017.
//  Copyright © 2017 appcat. All rights reserved.
//

import Foundation

class processJSON {
    var URL = fetchURL.URL
    var quizThemes : [Theme] = [Theme]()
    var themes : [Theme] = []
    var titles : [String] = []
    var descriptions : [String] = []
    
    func checkExist() {
        let tempURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(ProcessInfo.processInfo.globallyUniqueString, isDirectory: true)
        let filePath = tempURL!.appendingPathComponent("iQuiz.json").absoluteString
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            print("FILE AVAILABLE")
        } else {
            print("FILE NOT AVAILABLE")
        }
    }
    
    func HTTPRequest(completionHandler: @escaping () -> Void) {
        let task = URLSession.shared.dataTask(with: NSURL(string: URL)! as URL) { (data, response, error) -> Void in
            if error != nil {
                print(error)
            } else {
                let HTTPResponse = response as! HTTPURLResponse
                let statusCode = HTTPResponse.statusCode
                if (statusCode == 200) {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print(json)
                        
                        guard let subject = json as? [[String : AnyObject]] else {return}
                        for s in subject {
                            let title = s["title"] as? String
                            self.titles.append(title!)
                            let description = s["desc"] as? String
                            self.descriptions.append(description!)
                            let questions = s["questions"]
                            
                            var questionObjs : [Question] = []
                            
                            for q in questions as! [[String:Any]] {
                                let text = q["text"] as! String
                                let correctAnswerInt = q["answer"] as! String
                                let answerList = q["answers"] as! [String]
                                let correctAnswer = answerList[(Int(correctAnswerInt)! - 1)]
                                let inputquestion : Question = Question(text: text, answer: correctAnswer, choices: answerList)
                                questionObjs.append(inputquestion)
                            }
                            
                            let inputtopic: Theme = Theme(subject: String(describing: title), desc: String(describing: description), questions: questionObjs)
                            self.themes.append(inputtopic)
                        }
                        completionHandler()
                    }  catch {
                        print("Error Response! \n\(error)")
                    }
                }
            }
        }
        task.resume()
    }

}
