//
//  QuestionView.swift
//  Code History
//
//  Created by Juyon on 7/6/22.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    let question: Question
    
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack{
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                Spacer()
                HStack{
                    Button(action: <#T##() -> Void#>, label: <#T##() -> _#>)
                    ForEach(0..<question.possibleAnswers.count){ answerIndex in
                        Button (action: {
                            print("tapped on option with the text: \(question.possibleAnswers[answerIndex])")
                            viewModel.makeGuess(atIndex: answerIndex)
                        }) {
                            ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                                .background(viewModel.color(forOptionIndex: answerIndex))
                        }
                        .disabled(viewModel.guessWasMade)
                    }
                }
                if viewModel.guessWasMade {
                    Button(action: { viewModel.displayNextScreen() }) {
                        BottomTextView(str: "Next")
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Game().currentQuestion)
    }
}
