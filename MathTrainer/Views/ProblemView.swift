//
//  ProblemView.swift
//  MathTrainer
//
//  Created by Дмитрий Прохоренко on 26.12.2025.
//

import SwiftUI

struct ProblemView: View {
	let problem: MathProblem
	let isCorrect: Bool?
	let showAnimation: Bool
	
	var body: some View {
		VStack(spacing: 20) {
			// Пример
			Text(problem.question)
				.font(.system(size: 48, weight: .bold, design: .rounded))
				.foregroundColor(.textPrimary)
				.frame(maxWidth: .infinity)
				.padding(.vertical, 40)
				.background(
					RoundedRectangle(cornerRadius: 20)
						.fill(.cardBackground)
						.shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
				)
				.scaleEffect(showAnimation ? 1.01 : 1.0)
				.animation(.spring(response: 0.3), value: showAnimation)
		}
	}
}
