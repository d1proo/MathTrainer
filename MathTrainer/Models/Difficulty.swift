//
//  Untitled.swift
//  MathTrainer
//
//  Created by Дмитрий Прохоренко on 26.12.2025.
//

import Foundation

enum Difficulty: String, CaseIterable, Identifiable {
	case easy = "Ученик"
	case medium = "Студент"
	case hard = "Эксперт"
	
	var id: String { rawValue }
	
	var description: String {
		switch self {
		case .easy:
			return "Числа 1-10, сложение и вычитание"
		case .medium:
			return "Числа 1-20, +, -, ×"
		case .hard:
			return "Числа 1-50, все операции"
		}
	}
	
	var numberRange: ClosedRange<Int> {
		switch self {
		case .easy: return 1...10
		case .medium: return 1...20
		case .hard: return 1...50
		}
	}
	
	var operations: [MathOperation] {
		switch self {
		case .easy:
			return [.addition, .subtraction]
		case .medium:
			return [.addition, .subtraction, .multiplication]
		case .hard:
			return [.addition, .subtraction, .multiplication, .division]
		}
	}
}
