//
//  SignupView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 06/05/24.
//

import SwiftUI

struct SignupView: View {
    
    let action: () -> Void
    @StateObject var viewModel: SignupViewModel
    @Binding var isSignupActive: Bool
    @Binding var isSignInActive: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack{
                    Button(action: onBackBtnClick, label: {
                        Image("back-btn")
                    })
                    Spacer()
                }
                HStack{
                    Text("Register")
                        .font(Fonts.latoBoldFont(32))
                        .padding(.top,20)
                    Spacer()
                }
                Text("Username")
                    .padding(.top,10)
                TextField("Enter your name", text: $viewModel.userDetails.username)
                    .padding(12)
                    .frame(height: 48)
                    .overlay(viewModel.validation == .inValidUsername ? Color.red : Color.black,in:RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                if viewModel.validation == .inValidUsername {
                    Text(viewModel.validationErrorMessage)
                                        .foregroundColor(.red)
                }
                Text("Email")
                    .padding(.top,20)
                TextField("Enter your email", text: $viewModel.userDetails.email)
                    .keyboardType(.emailAddress)
                    .padding(12)
                    .frame(height: 48)
                    .overlay(viewModel.validation == .inValidEmail ? Color.red : Color.black,in:RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                if viewModel.validation == .inValidEmail {
                                    Text(viewModel.validationErrorMessage)
                                        .foregroundColor(.red)
                }
                Text("Password")
                    .padding(.top,20)
                SecureField("Enter your password", text: $viewModel.userDetails.password)
                    .padding(12)
                    .frame(height: 48)
                    .overlay(viewModel.validation == .inValidPassword ? Color.red : Color.black,in:RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                if viewModel.validation == .inValidPassword {
                                    Text(viewModel.validationErrorMessage)
                                        .foregroundColor(.red)
                }
                Text("Confirm Password")
                    .padding(.top,20)
                SecureField("Reenter your password", text: $viewModel.userDetails.repeatPassword)
                    .padding(12)
                    .frame(height: 48)
                    .overlay(viewModel.validation == .inValidRepeatPassword ? Color.red : Color.black,in:RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                if viewModel.validation == .inValidRepeatPassword {
                                    Text(viewModel.validationErrorMessage)
                                        .foregroundColor(.red)
                }
                Button(action: registerCtaAction, label: {
                    Text("Resister")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.accentColor)
                        .cornerRadius(4.0)
                })
                .padding(.vertical,30)
                HStack{
                    Text("Already have an account?")
                    Text("Login").padding(.leading,-6)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            isSignupActive = false
                            isSignInActive = true
                        }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal,24)
            .frame(maxWidth: 500)
            .navigationBarBackButtonHidden(true)
        }
        .scrollIndicators(.hidden)
    }
    
    func registerCtaAction() {
        if !viewModel.isValidUser() {
            return
        }
        DispatchQueue.global().async {
            viewModel.registerUser()
        }
        action()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            isSignInActive = false
            isSignupActive = false
        }
    }
    
    func onBackBtnClick() {
        isSignupActive = false
    }
}

#Preview {
    NavigationView {
        SignupView(action: {}, viewModel: SignupViewModel(AuthenticationManager()), isSignupActive: .constant(false), isSignInActive: .constant(false))
    }
}
