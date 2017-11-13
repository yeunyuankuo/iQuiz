//
//  Theme.swift
//  iQuiz
//
//  Created by Jessie Kuo on 12/11/2017.
//  Copyright © 2017 appcat. All rights reserved.
//

import Foundation

public class Theme {
    public var subject : String
    public var desc : String
    public var questions : [Question]
    
    init(subject : String, desc : String, questions : [Question]) {
        self.subject = subject
        self.desc = desc
        self.questions = questions
    }
}
