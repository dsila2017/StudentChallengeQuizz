//
//  BipolarView.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/14/24.
//

import SwiftUI

struct AddictionView: View {
    @EnvironmentObject var model: QuestionViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Text("Addiction Test")
                    .font(.title.bold())
                    .padding(.top, 40)
                TabView {
                    ForEach($model.AddictionQuestions) { $question in
                        VStack {
                            if let lastQuestion = model.AddictionQuestions.last, lastQuestion.id == question.id, model.checkAllSelected(type: model.AddictionQuestions) {
                                Spacer()
                                Spacer()
                                QuestionView(question: $question)
                                Spacer()
                                NavigationLink(destination: AddictionResult(model: model)) {
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
                    model.clearResults(type: &model.AddictionQuestions)
                })
                Spacer()
            }
        }
    }
}

#Preview {
    AddictionView()
}
