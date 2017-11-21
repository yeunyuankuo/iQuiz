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
    var titles : [String] = []
    var descriptions : [String] = []
    var themes : [Theme] = []
    func checkExist() {
        let tempURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(ProcessInfo.processInfo.globallyUniqueString, isDirectory: true)
        let filePath = tempURL!.appendingPathComponent("iQuiz.json").absoluteString
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            print("File found")
        } else {
            print("File not found")
        }
    }
    
    func HTTPRequest(completionHandler: @escaping () -> Void) {
        let task = URLSession.shared.dataTask(with: NSURL(string: URL)! as URL) { (data, response, error) -> Void in
            if error != nil {
                print("error")
            } else {
                let HTTPResponse = response as! HTTPURLResponse
                let statusCode = HTTPResponse.statusCode
                if (statusCode == 200) {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print(json)
                        
                        guard let subject = json as? [[String : AnyObject]] else {return}
                        for curr in subject {
                            let title = curr["title"] as? String
                            let description = curr["desc"] as? String
                            let questions = curr["questions"]
                            var qObjs : [Question] = []
                            self.titles.append(title!)
                            self.descriptions.append(description!)
                            
                            for currQ in questions as! [[String:Any]] {
                                let correctAnswerInt = currQ["answer"] as! String
                                let answerList = currQ["answers"] as! [String]
                                let text = currQ["text"] as! String
                                let correctAnswer = answerList[(Int(correctAnswerInt)! - 1)]
                                let inputQ : Question = Question(text: text, answer: correctAnswer, choices: answerList)
                                qObjs.append(inputQ)
                            }
                            let input: Theme = Theme(subject: String(describing: title), desc: String(describing: description), questions: qObjs)
                            self.themes.append(input)
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
