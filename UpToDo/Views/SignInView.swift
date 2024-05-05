//
//  SignInView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 05/05/24.
//

import SwiftUI

struct SignInView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Username")
                    .padding(.top,53)
                TextField("Enter your username", text: $username)
                    .padding(12)
                    .frame(height: 48)
                    .overlay(RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                Text("Password")
                    .padding(.top,24)
                TextField("Enter your password", text: $password)
                    .padding(12)
                    .frame(height: 48)
                    .overlay(RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                Button(action: {}, label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.accentColor)
                        .cornerRadius(4.0)
                })
                .padding(.top,69)
                HStack {
                    VStack {
                        Divider()
                            .background(Color.black)
                    }
                    Text("or")
                    VStack {
                        Divider()
                            .background(Color.black)
                    }
                }
                .padding(.vertical,30)
                Button(action: {}, label: {
                    HStack {
                        Image("google")
                        Text("Login with Google")
                            .foregroundColor(.black)
                    }
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
                })
                Spacer(minLength: 30)
                HStack{
                    Text("Don't have an account?")
                    NavigationLink(destination: SignupView()) {
                        Text("Register").padding(.leading,-6)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal,24)
            .frame(maxWidth: 500)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NavigationView {
        SignInView()
            .navigationTitle("Login")
    }
}
