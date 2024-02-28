//
//  Result.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/14/24.
//

import SwiftUI

struct Result: View {
    @State var model: QuestionViewModel
    var body: some View {
        VStack(spacing: 20) {
            Text(model.checkResult(type: model.depressionQuestions))
                .font(.title.bold())
            Text("Your score is: \(model.checkScore(type: model.depressionQuestions))")
                .font(.title2.bold())
            Text("Interpreting your Total Score")
                .bold()
            Group {
                Text("1-4: Minimal depression")
                Text("5-9: Mild depression")
                Text("10-14: Moderate depression")
                Text("15-19: Moderately severe depression")
                Text("20-27: Severe depression")
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: 400)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(24)
        .padding(.horizontal, 20)
        .shadow(radius: 10)
    }
}

#Preview {
    Result(model: QuestionViewModel())
}
