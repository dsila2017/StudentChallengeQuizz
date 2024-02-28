//
//  Questions.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/25/24.
//

import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let title: String
    let choices: [String]
    var isSelected: String = ""
}
