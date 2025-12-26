//
//  MathProblem.swift
//  MathTrainer
//
//  Created by Дмитрий Прохоренко on 26.12.2025.
//

import Foundation

struct MathProblem: Identifiable {
	let id = UUID()
	let firstNumber: Int
	let secondNumber: Int
	let operation: MathOperation
	let answer: Int
	
	var question: String {
		"\(firstNumber) \(operation.symbol) \(secondNumber) = ?"
	}
	
	var userAnswer: Int?
	
	var isCorrect: Bool {
		guard let userAnswer = userAnswer else { return false }
		return userAnswer == answer
	}
}
