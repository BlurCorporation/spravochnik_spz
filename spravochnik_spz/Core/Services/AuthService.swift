//
//  AuthService.swift
//  spravochnik_spz
//
//  Created by Николай Чунихин on 30.03.2023.
//
import Firebase
import FirebaseCore
import FirebaseAuth
import Foundation

struct UserModel {
    
}

enum TypeAuth {
    case email
    case google
    case apple
}


protocol AuthServicable {
    func isAuth() -> Bool
    func registUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    func loginUser(email: String, password: String, typeAuth: TypeAuth, completion: @escaping (Result<UserModel, Error>) -> Void)
    func logout()
}

final class AuthService {}

extension AuthService: AuthServicable {
    
    func isAuth() -> Bool {
        return (Auth.auth().currentUser != nil)
    }
    
    func loginUser(email: String, password: String, typeAuth: TypeAuth, completion: @escaping (Result<UserModel, Error>) -> Void) {
        switch typeAuth{
        case .email:
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if let error = error {
                    completion(.failure(error))
                }
                if let _ = user {
                    let userModel = UserModel()
                    completion(.success(userModel))
                }
            }
        case .google:
            print("google")
        case .apple:
            print("apple")
        }
            
    }
    
    func registUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
        
    }
    
}
