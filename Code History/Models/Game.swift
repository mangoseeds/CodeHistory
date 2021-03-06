//
//  Game.swift
//  Code History
//
//  Created by Juyon on 6/22/22.
//

import Foundation

struct Game {
    
    // Private(set) variables
    private(set) var currentQuestionIndex = 0
    private(set) var guesses = [Question: Int]() //can be read but not written from outside
    private(set) var isOver = false
    
    // Private variables
    private let questions = Question.allQuestions.shuffled()
    
    // Computed properties
    var guessCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0, 0)
        for (question, guessedIndex) in guesses {
            if guessedIndex == question.correctAnswerIndex {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }
    
    var numberOfQuestions: Int {
        questions.count
    }
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    // Internal Methods
    
    mutating func makeGuessForCurrentQuestion(atIndex index: Int){
        guesses[currentQuestion] = index
    }
    mutating func updateGameStatus(){
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            isOver = true
        }
        
    }
}
