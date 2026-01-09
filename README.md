# 🧮 MathTrainer - iOS Math Training App (MVVM/SwiftUI)
<div align="center">
<img width = "250" src="https://github.com/user-attachments/assets/057b0029-8cd9-4afd-8159-6d39739a0d65" />
<img width = "250" src="https://github.com/user-attachments/assets/21d0b706-843a-493c-a3d0-d471c5dedc8a" />
<img width = "250" src="https://github.com/user-attachments/assets/36d28d21-b762-43b1-9f54-6e272f053896" />
</div>

## 📱 About the App
MathTrainer is an interactive iOS application designed for practicing mathematical skills. The app offers infinite problem generation with three difficulty levels and instant feedback. Perfect for school students, university attendees, and anyone looking to keep their mind sharp.


## ✨ Features
### 🎯 Three Difficulty Levels
- Easy: Numbers 1-10, addition and subtraction

- Medium: Numbers 1-20, +, -, ×

- Hard: Numbers 1-50, all operations (+, -, ×, ÷)

### 🎮 Interactive Gameplay
- Intuitive interface with dark mode support

- Instant feedback with color indicators

- Visual animations for correct/incorrect answers

- Automatic generation of new problems

### 📊 Smart Problem System
- Guaranteed mathematically correct problems

- Intelligent number selection for division (only integer results)

- Automatic subtraction adjustment (non-negative answers)

- Diverse operations based on difficulty level

## 🏗️ Architecture
The app is built on clean MVVM architecture using modern SwiftUI practices:

```
MathTrainer/
├── MathTrainerApp.swift           # App entry point
├── Models/
│   ├── Difficulty.swift           # Difficulty level model
│   ├── MathOperation.swift        # Mathematical operations
│   └── MathProblem.swift          # Math problem model
├── ViewModels/
│   ├── GameViewModel.swift        # Game logic
│   └── MathProblemGenerator.swift # Problem generator
└── Views/
    ├── ContentView.swift          # Main coordinator
    ├── DifficultyView.swift       # Difficulty selection screen
    ├── GameView.swift             # Game screen
    ├── ProblemView.swift          # Problem display
    └── InputField.swift           # Animated input field
```

## 🔧 Key Technologies
- SwiftUI with declarative syntax

- Combine for reactive programming

- NavigationStack for modern navigation

- Custom animations with GeometryEffect

- Asset Catalogs for dark mode support

## 🎨 Smooth Animations
- InputField shake animation for incorrect answers

- Smooth fade-in/out for clear button

- Color transitions for input field border

## 🎯 User Experience
- Responsive design for all iPhone sizes

- Dark mode support with custom colors

- Intuitive navigation with NavigationStack

## 📦 Installation & Setup
- Clone the repository

- Open MathTrainer.xcodeproj in Xcode 15+

- Build and run on iOS 17.0+ simulator or device

- No external dependencies required

## 🚀 How to Use
- Launch the app

- Select your preferred difficulty level

- Solve the presented math problems

- Receive instant feedback on your answers

- Continue practicing with infinite problems

- Switch difficulty levels anytime

## 📝 Requirements
- iOS: 17.0+
- Xcode: 15.0+
- Swift: 5.9+
