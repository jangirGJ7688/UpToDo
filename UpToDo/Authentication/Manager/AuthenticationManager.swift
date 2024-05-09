//
//  AuthenticationManager.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 06/05/24.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    
    func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
    
    func createUser(userDetails: SignupModel, completion: @escaping(Result<User, Error>) -> Void){
        Auth.auth().createUser(withEmail: userDetails.email, password: userDetails.password) { (result, error) in
            if error == nil && result != nil {
                completion(.success(result!.user))
            }else{
                completion(.failure(error!))
            }
        }
    }
    
    func loginUser(userDetails: SigninModel, completion: @escaping(Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: userDetails.email, password: userDetails.password) { (result, error) in
            if error == nil && result != nil {
                completion(.success(result!.user))
            }else{
                completion(.failure(error!))
            }
        }
    }
    
    func resetPassword(email: String){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            debugPrint("Ganpat some error occured while sending reset password link \(String(describing: error?.localizedDescription))")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            debugPrint("Ganpat some error occured while signing out \(error.localizedDescription)")
        }
    }
}
