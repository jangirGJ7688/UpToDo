//
//  PasswordResetView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 09/05/24.
//

import SwiftUI

struct PasswordResetView: View {
    
    @Binding var isResetPasswordActive: Bool
    @State var email: String = ""
    @State var isShowAlert = false
    @State var isValidEmail = true
    @StateObject var viewModel: SigninViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Button(action: onBackBtnClick, label: {
                    Image("back-btn")
                })
                Spacer()
            }
            HStack{
                Text("Password Reset")
                    .font(Fonts.latoBoldFont(32))
                    .padding(.top,20)
                Spacer()
            }
            .padding(.bottom,30)
            TextField("Enter your email", text: $email)
                .keyboardType(.emailAddress)
                .padding(12)
                .frame(height: 48)
                .overlay(RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                .autocapitalization(.none)
                .autocorrectionDisabled()
            if !isValidEmail {
                Text("Please enter your email")
                    .foregroundColor(.red)
                    .font(Fonts.latoRegularFont(16))
            }
            Button(action: onResetBtnClick, label: {
                Text("Reset Password")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.accentColor)
                    .cornerRadius(4.0)
            })
            .padding(.top,20)
            Spacer()
        }
        .padding(24)
        .alert(isPresented: $isShowAlert) {
            withAnimation {
                Alert(title: Text("BOOM💥"),message: Text("Password reset link sent to your mail."),dismissButton: .default(Text("OK")))
            }
        }


    }
    
    func onBackBtnClick() {
        isResetPasswordActive = false
    }
    
    func onResetBtnClick() {
        if email.isEmpty {
            isValidEmail = false
            return
        }
        viewModel.resetPassword(with: email)
        isShowAlert = true
        email = ""
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            isShowAlert = false
            isResetPasswordActive = false
        }
    }
}

#Preview {
    PasswordResetView(isResetPasswordActive: .constant(false), viewModel: SigninViewModel(AuthenticationManager()))
}
