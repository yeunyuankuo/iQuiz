//
//  Question.swift
//  iQuiz
//
//  Created by Jessie Kuo on 12/11/2017.
//  Copyright © 2017 appcat. All rights reserved.
//

import Foundation

public class Question {
    public var text : String
    public var answer : String
    public var choices : [String]
    
    init(text : String, answer : String, choices : [String]){
        self.text = text
        self.answer = answer
        self.choices = choices
    }
}
