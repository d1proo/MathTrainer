//
//  GameViewModel.swift
//  MathTrainer
//
//  Created by Дмитрий Прохоренко on 26.12.2025.
//

import SwiftUI
import Combine

@MainActor
final class GameViewModel: ObservableObject {
	@Published var currentProblem: MathProblem?
	@Published var userInput = ""
	@Published var isAnswerCorrect: Bool?
	@Published var showAnimation = false
	@Published var score = 0
	
	private let difficulty: Difficulty
	private var generator: MathProblemGenerator
	
	init(difficulty: Difficulty) {
		self.difficulty = difficulty
		self.generator = MathProblemGenerator(difficulty: difficulty)
		generateNewProblem()
	}
	
	func generateNewProblem() {
		currentProblem = generator.generateProblem()
		userInput = ""
		isAnswerCorrect = nil
	}
	
	func submitAnswer() {
		guard let currentProblem = currentProblem,
			  let userAnswer = Int(userInput) else {
			return
		}
		
		let isCorrect = userAnswer == currentProblem.answer
		isAnswerCorrect = isCorrect
		
		withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
			showAnimation = true
		}
		
		if isCorrect {
			// Ждем немного и генерируем новый пример
			DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
				withAnimation {
					self.generateNewProblem()
					self.showAnimation = false
				}
			}
		} else {
			// Сбрасываем анимацию через секунду для повторной попытки
			DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
				withAnimation {
					self.showAnimation = false
					self.isAnswerCorrect = nil
				}
			}
		}
	}
	
	func validateInput() -> Bool {
		// Проверяем, что ввод состоит только из цифр и не пустой
		return !userInput.isEmpty && userInput.allSatisfy { $0.isNumber }
	}
}

// Генератор математических примеров
class MathProblemGenerator {
	private let difficulty: Difficulty
	
	init(difficulty: Difficulty) {
		self.difficulty = difficulty
	}
	
	func generateProblem() -> MathProblem {
		var firstNumber: Int
		var secondNumber: Int
		var operation: MathOperation
		
		repeat {
			firstNumber = Int.random(in: difficulty.numberRange)
			secondNumber = Int.random(in: difficulty.numberRange)
			operation = difficulty.operations.randomElement()!
			
			// Для вычитания гарантируем неотрицательный результат
			if operation == .subtraction && firstNumber < secondNumber {
				swap(&firstNumber, &secondNumber)
			}
			
		} while !operation.isValidOperation(firstNumber, secondNumber)
		
		let answer = operation.perform(firstNumber, secondNumber)
		
		return MathProblem(
			firstNumber: firstNumber,
			secondNumber: secondNumber,
			operation: operation,
			answer: answer
		)
	}
}
