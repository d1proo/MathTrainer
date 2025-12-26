//
//  DifficultyViewModel.swift
//  MathTrainer
//
//  Created by Дмитрий Прохоренко on 26.12.2025.
//

import SwiftUI
import Combine

@MainActor
final class DifficultyViewModel: ObservableObject {
	@Published var selectedDifficulty: Difficulty? = .easy
	
	func selectDifficulty(_ difficulty: Difficulty) {
		selectedDifficulty = difficulty
	}
}
