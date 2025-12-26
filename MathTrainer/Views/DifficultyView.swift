//
//  DifficultyView.swift
//  MathTrainer
//
//  Created by Дмитрий Прохоренко on 26.12.2025.
//

import SwiftUI

struct DifficultyView: View {
	@Binding var navigationPath: NavigationPath
	@StateObject private var viewModel = DifficultyViewModel()
	
	var body: some View {
		ZStack {
			Color(.mainBackground)
				.ignoresSafeArea()
			
			VStack(spacing: 24) {
				// Заголовок
				VStack(spacing: 8) {
					Text("Математический тренажер")
						.font(.largeTitle)
						.fontWeight(.bold)
						.foregroundColor(.textPrimary)
						.multilineTextAlignment(.center)
					
					Text("Выберите уровень сложности")
						.font(.title3)
						.foregroundColor(.textPrimary)
				}
				.padding(.top, 40)
				
				Spacer()
				
				// Карточки уровней сложности
				VStack(spacing: 20) {
					ForEach(Difficulty.allCases) { difficulty in
						DifficultyCard(
							difficulty: difficulty,
							isSelected: viewModel.selectedDifficulty == difficulty
						) {
							viewModel.selectDifficulty(difficulty)
						}
					}
				}
				.padding(.horizontal)
				
				Spacer()
				
				// Кнопка начала игры
				Button(action: {
					if let difficulty = viewModel.selectedDifficulty {
						navigationPath.append(difficulty)
					}
				}) {
					Text("Начать тренировку")
						.font(.title2)
						.fontWeight(.semibold)
						.foregroundColor(.white)
						.frame(maxWidth: .infinity)
						.padding()
						.background(
							viewModel.selectedDifficulty == nil ?
							Color.gray : .primaryBlue
						)
						.cornerRadius(15)
						.shadow(
							color: .primaryBlue.opacity(0.3),
							radius: 10,
							x: 0,
							y: 5
						)
				}
				.disabled(viewModel.selectedDifficulty == nil)
				.padding(.horizontal, 40)
				.padding(.bottom, 30)
			}
		}
		.navigationBarHidden(true)
	}
}

// Карточка уровня сложности (без изменений)
struct DifficultyCard: View {
	let difficulty: Difficulty
	let isSelected: Bool
	let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			VStack(alignment: .leading, spacing: 12) {
				HStack {
					Text(difficulty.rawValue)
						.font(.title2)
						.fontWeight(.bold)
						.foregroundColor(.textPrimary)
					
					Spacer()
					
					if isSelected {
						Image(systemName: "checkmark.circle.fill")
							.foregroundColor(.primaryBlue)
							.font(.title2)
					}
				}
				
				Text(difficulty.description)
					.font(.body)
					.foregroundColor(.textSecondary)
					.multilineTextAlignment(.leading)
			}
			.padding()
			.frame(maxWidth: .infinity, alignment: .leading)
			.background(
				RoundedRectangle(cornerRadius: 15)
					.fill(.cardBackground)
					.shadow(
						color: isSelected ?
							.primaryBlue.opacity(0.3) :
							Color.gray.opacity(0.2),
						radius: isSelected ? 10 : 5,
						x: 0,
						y: isSelected ? 5 : 2
					)
			)
			.overlay(
				RoundedRectangle(cornerRadius: 15)
					.stroke(
						isSelected ?
							.primaryBlue :
							Color.clear,
						lineWidth: isSelected ? 3 : 0
					)
			)
		}
		.buttonStyle(.plain)
	}
}
