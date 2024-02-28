//
//  PTSDView.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/14/24.
//

import SwiftUI

struct PTSDView: View {
    @EnvironmentObject var model: QuestionViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Text("PTSD Test")
                    .font(.title.bold())
                    .padding(.top, 40)
                TabView {
                    ForEach($model.PTSDQuestions) { $question in
                        VStack {
                            if let lastQuestion = model.PTSDQuestions.last, lastQuestion.id == question.id, model.checkAllSelected(type: model.PTSDQuestions) {
                                Spacer()
                                Spacer()
                                QuestionView(question: $question)
                                Spacer()
                                NavigationLink(destination: PTSDResult(model: model)) {
                                    Text("Submit")
                                        .frame(maxWidth: 140)
                                        .frame(height: 56)
                                        .foregroundColor(.white)
                                        .background(.black)
                                        .cornerRadius(40)
                                }
                                Spacer()
                            } else {
                                QuestionView(question: $question)
                            }
                        }
                    }
                }
                .tabViewStyle(.page)
                .onAppear(perform: {
                    model.clearResults(type: &model.PTSDQuestions)
                })
                Spacer()
            }
        }
    }
}

#Preview {
    PTSDView()
}
