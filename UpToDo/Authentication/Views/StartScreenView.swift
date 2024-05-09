//
//  StartScreenView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 06/05/24.
//

import SwiftUI

struct StartScreenView: View {
    
    let action: () -> Void
    @State var isSignInActive: Bool = false
    @State var isSignupActive: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Text("Welcome to UpTodo")
                        .font(Fonts.latoBoldFont(32))
                        .padding(.bottom,26)
                    Text("Please login to your account or create new account to continue")
                        .font(Fonts.latoRegularFont(16))
                    Spacer(minLength: 300)
                    Text("Login".uppercased())
                        .font(Fonts.latoRegularFont(16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.accentColor)
                        .cornerRadius(4.0)
                        .padding(.bottom,28)
                        .onTapGesture {
                            isSignInActive = true
                        }
                    Text("create account".uppercased())
                        .font(Fonts.latoRegularFont(16))
                        .foregroundColor(.black)
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .overlay(RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                        .onTapGesture {
                            isSignupActive = true
                        }
                }
                .padding(.horizontal,24)
                .padding(.vertical,50)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 500)
            }
        }
        .fullScreenCover(isPresented: $isSignInActive, content: {
            SignInView(action: action, viewModel: SigninViewModel(AuthenticationManager()), isSignInActive: $isSignInActive, isSignupActive: $isSignupActive)
        })
        .fullScreenCover(isPresented: $isSignupActive, content: {
            SignupView(action: action, viewModel: SignupViewModel(AuthenticationManager()), isSignupActive: $isSignupActive, isSignInActive: $isSignInActive)
        })
    }
}

#Preview {
    NavigationView {
        StartScreenView(action: {})
    }
}
