//
//  OnboardingModel.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 06/05/24.
//

import Foundation

struct OnboardingItem: Identifiable {
    let id: String
    let imageName: String
    let title: String
    let subtitle: String
    let forwordBtnText: String
    
    init(id: String = UUID().uuidString,imageName: String, title: String, subtitle: String, forwordBtnText: String = "NEXT") {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        self.forwordBtnText = forwordBtnText
    }
}
