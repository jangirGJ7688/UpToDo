//
//  SignupViewModel.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 08/05/24.
//

import Foundation

enum Validation {
    case inValidUsername
    case inValidEmail
    case inValidPassword
    case inValidRepeatPassword
    case allValid
    case allInvalid
}

final class SignupViewModel: ObservableObject {
    
    private var manager: AuthenticationManager
    @Published var userDetails: SignupModel
    @Published var validation: Validation = Validation.allInvalid
    var validationErrorMessage: String = ""
    
    init(_ manager: AuthenticationManager) {
        self.manager = manager
        self.userDetails = SignupModel()
    }
    
    func registerUser() {
        self.manager.createUser(userDetails: userDetails) { result in
            switch result {
            case .success(let user):
                debugPrint("Ganpat user register successfully with email \(String(describing: user.email))")
            case .failure(let error):
                debugPrint("Ganpat user can not able to register with error \(error.localizedDescription)")
            }
        }
    }
    
    func isValidUser() -> Bool {
        isValidUsername()
        return validation == .allValid
    }
}

extension SignupViewModel {
    
    // Username, Email, Password Validation
    
    private func isValidUsername() {
        if userDetails.username.count < 3 {
            validation = .inValidUsername
            validationErrorMessage = "Username should be of atleast 3 characters."
        }else {
            isValidEmail()
        }
    }
    
    private func isValidEmail() {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: userDetails.email) {
            validation = .inValidEmail
            validationErrorMessage = "Please enter a valid email."
        }else {
            validatePassword()
        }
    }
    
    private func validatePassword(){
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if !passwordPredicate.evaluate(with: userDetails.password) {
            validation = .inValidPassword
            validationErrorMessage = "A minimum 8 characters password contains a combination of uppercase and lowercase letter and number are required."
        }else {
            isPasswordMatching()
        }
    }
    
    private func isPasswordMatching() {
        if userDetails.repeatPassword.isEmpty || userDetails.password != userDetails.repeatPassword {
            validation = .inValidRepeatPassword
            validationErrorMessage = "Sorry, your Passwords were not matching."
        }else {
            validation = .allValid
        }
    }
}
