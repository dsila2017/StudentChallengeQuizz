//
//  QuestionView.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/14/24.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question: Question
    var body: some View {
        VStack(spacing: 20) {
            Text(question.title)
                .font(.title2.bold())
                .padding(.bottom, 40)
            
            ForEach(question.choices, id:\.self) { answers in
                Button(action: {
                    question.isSelected = answers
                }, label: {
                    if question.isSelected == answers {
                        HStack {
                            Circle()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                            Text(answers)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .bold()
                        .tint(.mint)
                    } else {
                        HStack {
                            Circle()
                                .stroke()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                            Text(answers)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .bold()
                        .tint(.primary)
                    }
                })
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: 440)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(24)
        .padding(.horizontal, 20)
        .shadow(radius: 10)
    }
}
