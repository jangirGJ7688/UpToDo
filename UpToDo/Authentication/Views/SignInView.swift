//
//  SignInView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 05/05/24.
//

import SwiftUI

struct SignInView: View {
    
    let action: () -> Void
    @StateObject var viewModel: SigninViewModel
    @Binding var isSignInActive: Bool
    @Binding var isSignupActive: Bool
    @State var isResetPasswordActive = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack{
                    Button(action: onBackClick, label: {
                        Image("back-btn")
                    })
                    Spacer()
                }
                HStack{
                    Text("Login")
                        .font(Fonts.latoBoldFont(32))
                        .padding(.top,20)
                    Spacer()
                }
                Text("Username")
                    .padding(.top,20)
                TextField("Enter your email", text: $viewModel.userDetails.email)
                    .keyboardType(.emailAddress)
                    .padding(12)
                    .frame(height: 48)
                    .overlay(RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                    .autocapitalization(.none)
                Text("Password")
                    .padding(.top,24)
                SecureField("Enter your password", text: $viewModel.userDetails.password)
                    .padding(12)
                    .frame(height: 48)
                    .overlay(RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                if !viewModel.isValidUser{
                    Text("Invalid cardientials")
                        .foregroundColor(.red)
                        .font(Fonts.latoRegularFont(20))
                        .padding(.top,10)
                }
                Button(action: loginBtnAction, label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.accentColor)
                        .cornerRadius(4.0)
                })
                .padding(.top,69)
                Spacer(minLength: 30)
                Text("Forgot Password")
                    .foregroundColor(.accentColor)
                    .underline()
                    .frame(maxWidth: .infinity)
                    .padding(.bottom,10)
                    .onTapGesture {
                        isResetPasswordActive = true
                    }
                HStack{
                    Text("Don't have an account?")
                    Text("Register").padding(.leading,-6)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            isSignInActive = false
                            isSignupActive = true
                        }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal,24)
            .frame(maxWidth: 500)
            .navigationBarBackButtonHidden(true)
        }
        .scrollIndicators(.hidden)
        .fullScreenCover(isPresented: $isResetPasswordActive,content: {
            PasswordResetView(isResetPasswordActive: $isResetPasswordActive, viewModel: viewModel)
        })
    }
    
    func loginBtnAction() {
        viewModel.validEmailPassword()
        if !viewModel.isValidUser { return }
        viewModel.signInUser()
        if !viewModel.isValidUser { return }
        action()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isSignupActive = false
            isSignInActive = false
        }
    }
    
    func onBackClick() {
        isSignInActive = false
    }
}

#Preview {
    SignInView(action: {}, viewModel: SigninViewModel(AuthenticationManager()), isSignInActive: .constant(true), isSignupActive: .constant(false))
}
