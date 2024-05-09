//
//  SigninViewModel.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 08/05/24.
//

import Foundation
import FirebaseAuth

final class SigninViewModel: ObservableObject {
    
    private var manager: AuthenticationManager
    @Published var userDetails: SigninModel
    @Published var isValidUser: Bool = true
    
    init(_ manager: AuthenticationManager) {
        self.manager = manager
        self.userDetails = SigninModel()
    }
    
    func signInUser() {
        self.manager.loginUser(userDetails: userDetails) { [weak self] result in
            switch result {
                case .success(let user):
                    self?.isValidUser = true
                    debugPrint("Ganpat user login successfully with email \(String(describing: user.email))")
                case .failure(let error):
                    self?.isValidUser = false
                    debugPrint("Ganpat user can not able to login with error \(error.localizedDescription)")
            }
        }
    }
    
    func resetPassword(with email: String) {
        self.manager.resetPassword(email: email)
    }
    
    func validEmailPassword() {
        if userDetails.email.isEmpty || userDetails.password.count < 8 {
            isValidUser = false
        }else {
            isValidUser = true
        }
    }
    
}
