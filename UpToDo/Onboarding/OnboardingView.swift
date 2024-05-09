//
//  OnboardingView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 06/05/24.
//

import SwiftUI

struct OnboardingView: View {
    var item: OnboardingItem
    @Binding var currentStep: OnboardingStep
    let action: () -> Void
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {
                        action()
                    }, label: {
                        Text("Skip".uppercased())
                            .foregroundColor(.black)
                    })
                    Spacer()
                }
                Image(item.imageName)
                    .frame(height: 296)
                HStack {
                    ForEach(0..<3){ i in
                        Divider()
                            .frame(height: 4)
                            .frame(maxWidth: 26)
                            .overlay(currentStep.rawValue == i ? Color(uiColor: UIColor(red: 0.686, green: 0.686, blue: 0.686, alpha: 1)) : Color.black)
                            .cornerRadius(2.0)
                    }
                }
                .padding(.vertical,52)
                Text(item.title)
                    .font(.custom("Lato", size: 32))
                    .padding(.bottom,42)
                Text(item.subtitle)
                    .font(.custom("Lato", size: 16))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8.0)
                    .frame(maxWidth: 300)
                Spacer(minLength: 100)
                HStack {
                    Text("Back".uppercased())
                        .padding(.vertical,12)
                        .padding(.horizontal,24)
                        .frame(height: 48)
                        .overlay(Color.accentColor, in: RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                        .onTapGesture {
                            withAnimation {
                                currentStep = OnboardingStep(rawValue: currentStep.rawValue - 1) ?? OnboardingStep.onboarding1
                            }
                        }
                    Spacer()
                    Text(item.forwordBtnText.uppercased())
                        .padding(.vertical,12)
                        .padding(.horizontal,24)
                        .frame(height: 48)
                        .background(Color.accentColor)
                        .cornerRadius(4.0)
                        .onTapGesture {
                            withAnimation {
                                if currentStep == .onboarding3 {
                                    action()
                                }else {
                                    currentStep = OnboardingStep(rawValue: currentStep.rawValue+1)!
                                }
                            }
                        }
                }
            }
            .padding(.horizontal,24)
            .padding(.bottom,62)
        }
    }
}

#Preview {
    OnboardingView(item: OnboardingItem(imageName: "onboard1", title: "Manage your tasks", subtitle: "You can easily manage all of your daily tasks in DoMe for free", forwordBtnText: "Next"), currentStep: .constant(OnboardingStep.onboarding1), action: {})
}
