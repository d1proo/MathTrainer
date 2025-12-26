//
//  InputField.swift
//  MathTrainer
//
//  Created by Дмитрий Прохоренко on 26.12.2025.
//

import SwiftUI

struct InputField: View {
	@Binding var text: String
	let onSubmit: () -> Void
	let isCorrect: Bool?
	@State private var shakeCount: CGFloat = 0
	
	var body: some View {
		VStack(spacing: 10) {
			Text("Введите ответ:")
				.font(.headline)
				.foregroundColor(.textSecondary)
			
			// Весь ZStack с анимацией тряски
			ZStack(alignment: .trailing) {
				TextField("", text: $text)
					.font(.system(size: 36, weight: .bold, design: .rounded))
					.multilineTextAlignment(.center)
					.keyboardType(.numberPad)
					.padding(.horizontal, 20)
					.padding(.vertical, 16)
					.frame(width: 250)
					.background(
						RoundedRectangle(cornerRadius: 15)
							.stroke(borderColor, lineWidth: borderWidth)
					)
					.onSubmit(onSubmit)
				
				if !text.isEmpty {
					Button(action: {
						withAnimation(.spring(response: 0.3)) {
							text = ""
						}
					}) {
						Image(systemName: "xmark")
							.font(.title2)
							.foregroundColor(.textSecondary.opacity(0.7))
					}
					.padding(.trailing, 16)
					.transition(.scale.combined(with: .opacity))
					.animation(.spring(response: 0.3), value: text.isEmpty)
				}
			}
			.frame(height: 70)
			.modifier(ShakeModifier(animatableData: shakeCount))
		}
		.padding(.horizontal, 40)
		.onChange(of: isCorrect) { oldValue, newValue in
			guard let newValue = newValue else { return }
			
			if !newValue {  // Если ответ неправильный
				// Увеличиваем shakeCount, что вызовет новую анимацию
				withAnimation(.spring(response: 0.1, dampingFraction: 0.3)) {
					shakeCount += 2
				}
			}
		}
		.onChange(of: text) { _, newValue in
			shakeCount = 0
		}
	}
	
	private var borderColor: Color {
		if let isCorrect = isCorrect {
			return isCorrect ? .primaryGreen : .primaryRed
		} else {
			return .textSecondary.opacity(0.3)
		}
	}
	
	private var borderWidth: CGFloat {
		isCorrect != nil ? 3 : 2
	}
}

// Модификатор для тряски
struct ShakeModifier: GeometryEffect {
	var amount: CGFloat = 5
	var shakesPerUnit = 3
	var animatableData: CGFloat
	
	func effectValue(size: CGSize) -> ProjectionTransform {
		ProjectionTransform(
			CGAffineTransform(
				translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
				y: 0
			)
		)
	}
}
