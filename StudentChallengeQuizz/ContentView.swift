//
//  ContentView.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = QuestionViewModel()
    
    var body: some View {
        TabView {
            DepressionView()
                .tabItem {
                    Image(systemName: "figure")
                    Text("Depression")
                }
            AnxietyView()
                .tabItem {
                    Image(systemName: "brain.filled.head.profile")
                    Text("Anxiety")
                }
            PTSDView()
                .tabItem {
                    Image(systemName: "figure.stand.line.dotted.figure.stand")
                    Text("PTSD")
                }
            AddictionView()
                .tabItem {
                    Image(systemName: "brain")
                    Text("Addiction")
                }
        }
        .environmentObject(model)
        .tint(.primary)
    }
}

#Preview {
    ContentView()
}
