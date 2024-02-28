//
//  AnxietyView.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/14/24.
//

import SwiftUI

struct AnxietyView: View {
    @EnvironmentObject var model: QuestionViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Text("Anxiety Test")
                    .font(.title.bold())
                    .padding(.top, 40)
                TabView {
                    ForEach($model.anxietyQuestions) { $question in
                        VStack {
                            if let lastQuestion = model.anxietyQuestions.last, lastQuestion.id == question.id, model.checkAllSelected(type: model.anxietyQuestions) {
                                Spacer()
                                Spacer()
                                QuestionView(question: $question)
                                Spacer()
                                NavigationLink(destination: AnxietyResult(model: model)) {
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
                    model.clearResults(type: &model.anxietyQuestions)
                })
                Spacer()
            }
        }
    }
}

#Preview {
    AnxietyView()
}
