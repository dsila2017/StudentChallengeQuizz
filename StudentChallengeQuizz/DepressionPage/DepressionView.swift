//
//  DepressionVIew.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/14/24.
//

import SwiftUI

struct DepressionView: View {
    @EnvironmentObject var model: QuestionViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Text("Depression Test")
                    .font(.title.bold())
                    .padding(.top, 40)
                TabView {
                    ForEach($model.depressionQuestions) { $question in
                        VStack {
                            if let lastQuestion = model.depressionQuestions.last, lastQuestion.id == question.id, model.checkAllSelected(type: model.depressionQuestions) {
                                Spacer()
                                Spacer()
                                QuestionView(question: $question)
                                Spacer()
                                NavigationLink(destination: Result(model: model)) {
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
                    model.clearResults(type: &model.depressionQuestions)
                })
                Spacer()
            }
        }
    }
}

#Preview {
    DepressionView()
}
