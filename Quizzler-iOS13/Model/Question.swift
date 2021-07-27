//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ivan Stoilov on 26.07.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let question: String
    let answer: String
    
    init(q: String, a: String){
        self.question = q
        self.answer = a
    }
}
