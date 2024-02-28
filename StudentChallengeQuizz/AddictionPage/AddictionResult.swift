//
//  BipolarResult.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/14/24.
//

import SwiftUI

struct AddictionResult: View {
    @State var model: QuestionViewModel
    var body: some View {
        VStack(spacing: 20) {
            Text(model.checkAddictionResult(type: model.AddictionQuestions))
                .font(.title.bold())
            Text("Your score is: \(model.checkPTSDandAddiction(type: model.AddictionQuestions)) / 4")
                .font(.title2.bold())
                .padding(.bottom, 20)
            Text("Your score indicates the number of times you answered “yes.” A score of two or more indicates a likely drug or alcohol problem.")
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: 400)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(24)
        .padding(.horizontal, 20)
        .shadow(radius: 10)
    }
}
