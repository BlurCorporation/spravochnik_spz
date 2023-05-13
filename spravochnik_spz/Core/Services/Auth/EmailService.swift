//
//  EmailService.swift
//  spravochnik_spz
//
//  Created by Николай Чунихин on 12.05.2023.
//

import Foundation
import FirebaseAuth

protocol EmailServicable {
    func isAuth() -> Bool
    func registUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?) -> Void)
    func loginUser(with userRequest: LoginUserRequest,  completion: @escaping (Error?) -> Void)
    func logout(completion: @escaping (Error?) -> Void)
}

final class EmailService {}

extension EmailService: EmailServicable {
    func isAuth() -> Bool {
        return (Auth.auth().currentUser != nil)
    }
    
    func registUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?) -> Void) {
        let username = userRequest.username
        let email = userRequest.email
        let password = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            //            let db = Firestore.firestore()
            //
            //            db.collection("users")
            //                .document(resultUser.uid)
            //                .setData([
            //                    "username": username,
            //                    "email": email
            //                ]) { error in
            //                    if let error = error {
            //                        completion(false, error)
            //                        return
            //                    }
            //
            //                    completion(true, nil)
            //                }
        }
    }
    
    func loginUser(with userRequest: LoginUserRequest, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
            
            
        }
    }
    
    func logout(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
    
}
