//
//  MathOperation.swift
//  MathTrainer
//
//  Created by Дмитрий Прохоренко on 26.12.2025.
//

import Foundation

enum MathOperation: String, CaseIterable {
	case addition = "+"
	case subtraction = "−"
	case multiplication = "×"
	case division = "÷"
	
	var symbol: String {
		rawValue
	}
	
	func perform(_ a: Int, _ b: Int) -> Int {
		switch self {
		case .addition:
			return a + b
		case .subtraction:
			return a - b
		case .multiplication:
			return a * b
		case .division:
			// Гарантируем целочисленное деление без остатка
			return a / b
		}
	}
	
	// Проверка допустимости операции (для деления)
	func isValidOperation(_ a: Int, _ b: Int) -> Bool {
		switch self {
		case .division:
			return b != 0 && a % b == 0
		default:
			return true
		}
	}
}
