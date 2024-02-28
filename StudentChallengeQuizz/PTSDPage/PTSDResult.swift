//
//  PTSDResult.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/14/24.
//

import SwiftUI

struct PTSDResult: View {
    @State var model: QuestionViewModel
    var body: some View {
        VStack(spacing: 20) {
            Text(model.checkPTSDResult(type: model.PTSDQuestions))
                .font(.title.bold())
            Text("Your score is: \(model.checkPTSDandAddiction(type: model.PTSDQuestions)) / 5")
                .font(.title2.bold())
            Text("The authors suggest that in most circumstances the results of the PC-PTSD should be considered “positive” if a patient answers “yes” to any 3 items. Those screening positive should then be assessed with a structured interview for PTSD. The screen does not include a list of potentially traumatic events.")
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
    PTSDResult(model: QuestionViewModel())
}
