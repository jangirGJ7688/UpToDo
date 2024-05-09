//
//  OnboardingContrainerView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 06/05/24.
//

import SwiftUI

enum OnboardingStep: Int {
    case onboarding1 = 0
    case onboarding2 = 1
    case onboarding3 = 2
}

struct OnboardingContrainerView: View {
    
    let action: () -> Void
    @State private var currentOnbordingStep = OnboardingStep.onboarding1
    
    var body: some View {
        switch currentOnbordingStep {
        case .onboarding1:
            OnboardingView(item: OnboardingItem(imageName: "onboard1",
                                                title: "Manage your tasks",
                                                subtitle: "You can easily manage all of your daily tasks in DoMe for free"),
                           currentStep: $currentOnbordingStep, 
                           action: action)
        case .onboarding2:
            OnboardingView(item: OnboardingItem(imageName: "onboard2",
                                                title: "Create daily routine",
                                                subtitle: "In Uptodo  you can create your personalized routine to stay productive"), 
                           currentStep: $currentOnbordingStep, 
                           action: action)
        case .onboarding3:
            OnboardingView(item: OnboardingItem(imageName: "onboard3",
                                                title: "Orgonaize your tasks",
                                                subtitle: "You can organize your daily tasks by adding your tasks into separate categories",
                                                forwordBtnText: "Get Started"),
                           currentStep: $currentOnbordingStep,
                           action: action)
        }
    }
}

#Preview {
    OnboardingContrainerView(action: {})
}
