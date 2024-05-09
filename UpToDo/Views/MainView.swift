//
//  MainView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 08/05/24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        ZStack {
            switch session.currentState {
            case .onboarding:
                OnboardingContrainerView(action: session.completeOnbording)
            case .login:
                StartScreenView(action: session.completeLogin)
            case .deshboard:
                HomeView()
            default:
                EmptyView()
            }
        }
        .animation(.easeInOut, value: session.currentState)
        .onAppear {
            session.configureCurrentState()
        }
    }
}

#Preview {
    MainView()
}
