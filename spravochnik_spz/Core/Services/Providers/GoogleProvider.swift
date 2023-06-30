//
//  GoogleProvider.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 06.06.2023.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

protocol GoogleProviderable {
    func signIn(completion: @escaping (Error?) -> Void,
                viewController: UIViewController)
}

final class GoogleProvider {}

extension GoogleProvider: GoogleProviderable {
    func signIn(completion: @escaping (Error?) -> Void,
                viewController: UIViewController) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { [unowned self] result, error in
          guard error == nil else {
              completion(error)
            return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { result, error in
                guard let userId = Auth.auth().currentUser?.uid else { return }
                FirebaseService.shared.addUserID(userID: userId)
                completion(nil)
            }
        }
    }
}
