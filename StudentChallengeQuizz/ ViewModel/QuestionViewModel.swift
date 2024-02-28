//
//  QuestionViewModel.swift
//  StudentChallengeQuizz
//
//  Created by David on 2/14/24.
//

import Foundation

@Observable
class QuestionViewModel: ObservableObject {
    
    var depressionQuestions = [
        Question(title: "Little interest or pleasure in doing things", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Feeling down, depressed, or hopeless", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Trouble falling or staying asleep, or sleeping too much", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Feeling tired or having little energy", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Poor appetite or overeating", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Feeling bad about yourself - or that you are a failure or have let yourself or your family down", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Trouble concentrating on things, such as reading the newspaper or watching television", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Moving or speaking so slowly that other people could have noticed", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Thoughts that you would be better off dead, or of hurting yourself", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people?", choices: ["Not difficult at all", "Somewhat difficult", "Very difficult", "Extremely difficult"]),
    ]
    
    var anxietyQuestions = [
        Question(title: "Feeling nervous, anxious, or on edge", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Not being able to stop or control worrying", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Worrying too much about different things", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Trouble relaxing", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Being so restless that it is hard to sit still", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Becoming easily annoyed or irritable", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"]),
        Question(title: "Feeling afraid, as if something awful might happen", choices: ["Not at all", "Several days", "More than half the days", "Nearly every day"])
    ]
    
    var PTSDQuestions = [
        Question(title: "had nightmares about the event(s) or thought about the event(s) when you did not want to?", choices: ["No", "Yes"]),
        Question(title: "tried hard not to think about the event(s) or went out of your way to avoid situations that reminded you of the event(s)?", choices: ["No", "Yes"]),
        Question(title: "been constantly on guard, watchful, or easily startled?", choices: ["No", "Yes"]),
        Question(title: "felt numb or detached from people, activities, or your surroundings?", choices: ["No", "Yes"]),
        Question(title: "felt guilty or unable to stop blaming yourself or others for the event(s) or any problems the event(s) may have caused?", choices: ["No", "Yes"]),
    ]
    
    var AddictionQuestions = [
        Question(title: "Have you ever felt that you ought to cut down on your drinking or drug use?", choices: ["No", "Yes"]),
        Question(title: "Have people annoyed you by criticizing your drinking or drug use?", choices: ["No", "Yes"]),
        Question(title: "Have you ever felt bad or guilty about your drinking or drug use?", choices: ["No", "Yes"]),
        Question(title: "Have you ever had a drink or used drugs first thing in the morning to steady your nerves or to get rid of a hangover?", choices: ["No", "Yes"])
    ]
    
    func checkAllSelected(type: [Question]) -> Bool {
        return type.filter({$0.isSelected == ""}).isEmpty
    }
    
    func checkScore(type: [Question]) -> Int {
        var score = 0
        for question in type {
            if question.isSelected == "Not at all" {
                score += 0
            } else if question.isSelected == "Several days" {
                score += 1
            } else if question.isSelected == "More than half the days" {
                score += 2
            } else if question.isSelected == "Nearly every day" {
                score += 3
            }
        }
        return score
    }
    
    func checkResult(type: [Question]) -> String {
        switch checkScore(type: type) {
        case 1...4:
            "Minimal depression"
        case 5...9:
            "Mild depression"
        case 10...14:
            "Moderate depression"
        case 15...19:
            "Moderately severe depression"
        case 20...27:
            "Severe depression"
        default:
            "Result"
        }
    }
    
    func checkPTSDandAddiction(type: [Question]) -> Int {
        var result = 0
        for question in type {
            if question.isSelected == "Yes" {
                result += 1
            }
        }
        return result
    }
    
    func checkPTSDResult(type: [Question]) -> String {
        switch checkPTSDandAddiction(type: type) {
        case 2...5:
            "Positive"
        default:
            "Negative"
        }
    }
    
    func checkAddictionResult(type: [Question]) -> String {
        switch checkPTSDandAddiction(type: type) {
        case 1...4:
            "Alcohol/Drug addicted"
        default:
            "No addiction"
        }
    }
    
    func clearResults(type: inout [Question]) {
        for index in 0..<type.count {
            type[index].isSelected = ""
        }
    }
}
