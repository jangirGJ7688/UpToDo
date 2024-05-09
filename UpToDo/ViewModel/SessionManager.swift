//
//  SessionManager.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 08/05/24.
//

import Foundation

enum UserDefaultsKeys {
    static let onboardingKey = "Onboarding_Key"
    static let loginKey = "Login_Key"
}

final class SessionManager: ObservableObject {
    
    enum CurrentState {
        case onboarding
        case login
        case deshboard
    }
    
    @Published private(set) var currentState: CurrentState?
    
    func configureCurrentState() {
        let hasCompletedOnbording = UserDefaults.standard.bool(forKey: UserDefaultsKeys.onboardingKey)
        let hasCompletedLogin = UserDefaults.standard.bool(forKey: UserDefaultsKeys.loginKey)
        
        if hasCompletedLogin && hasCompletedOnbording {
            currentState = .deshboard
        }else if hasCompletedOnbording {
            currentState = .login
        }else {
            currentState = .onboarding
        }
    }
    
    func completeOnbording() {
        currentState = .login
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.onboardingKey)
    }
    
    func completeLogin() {
        currentState = .deshboard
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.loginKey)
    }
}
