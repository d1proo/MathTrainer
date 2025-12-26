//
//  MathTrainerApp.swift
//  MathTrainer
//
//  Created by Дмитрий Прохоренко on 26.12.2025.
//

import SwiftUI

@main
struct MathTrainerApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
	}
}

struct ContentView: View {
	@State private var navigationPath = NavigationPath()
	
	var body: some View {
		NavigationStack(path: $navigationPath) {
			DifficultyView(navigationPath: $navigationPath)
				.navigationDestination(for: Difficulty.self) { difficulty in
					GameView(difficulty: difficulty, navigationPath: $navigationPath)
				}
		}
	}
}
