//
//  GameView.swift
//  MathTrainer
//
//  Created by Дмитрий Прохоренко on 26.12.2025.
//

import SwiftUI

struct GameView: View {
	let difficulty: Difficulty
	@Binding var navigationPath: NavigationPath
	@StateObject private var viewModel: GameViewModel
	@Environment(\.dismiss) private var dismiss
	
	init(difficulty: Difficulty, navigationPath: Binding<NavigationPath>) {
		self.difficulty = difficulty
		self._navigationPath = navigationPath
		_viewModel = StateObject(wrappedValue: GameViewModel(difficulty: difficulty))
	}
	
	var body: some View {
		ZStack {
			Color(.mainBackground)
				.ignoresSafeArea()
			
			VStack(spacing: 30) {
				// Верхняя панель
				HStack {
					Button(action: {
						// Возвращаемся на главный экран
						navigationPath.removeLast()
					}) {
						HStack(spacing: 6) {
							Image(systemName: "chevron.left")
							Text("Уровни")
						}
						.font(.headline)
						.foregroundColor(.primaryBlue)
					}
					
					Spacer()
					
					// Индикатор уровня
					Text(difficulty.rawValue)
						.font(.headline)
						.padding(.horizontal, 16)
						.padding(.vertical, 8)
						.background(
							Capsule()
								.fill(.primaryBlue.opacity(0.1))
						)
						.foregroundColor(.primaryBlue)
				}
				.padding(.horizontal)
				.padding(.top)
				
				Spacer()
				
				// Математический пример
				if let problem = viewModel.currentProblem {
					ProblemView(
						problem: problem,
						isCorrect: viewModel.isAnswerCorrect,
						showAnimation: viewModel.showAnimation
					)
					.padding(.horizontal)
				}
				
				Spacer()
				
				// Поле ввода
				VStack(spacing: 20) {
					InputField(
						text: $viewModel.userInput,
						onSubmit: viewModel.submitAnswer,
						isCorrect: viewModel.isAnswerCorrect
					)
					
					// Кнопка ответа
					Button(action: viewModel.submitAnswer) {
						Text("Проверить")
							.font(.title2)
							.fontWeight(.semibold)
							.foregroundColor(.white)
							.frame(maxWidth: .infinity)
							.padding()
							.background(
								viewModel.validateInput() ?
									.primaryBlue : Color.gray
							)
							.cornerRadius(15)
					}
					.disabled(!viewModel.validateInput())
					.padding(.horizontal, 40)
				}
				.padding(.bottom, 30)
			}
		}
		.navigationBarHidden(true)
	}
}
