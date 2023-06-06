//
//  AppleService.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 23.05.2023.
//

import Foundation
import FirebaseAuth
import AuthenticationServices
import CryptoKit

protocol AppleServicable {
    func handleAppleIdRequest(completion: @escaping (Bool, Error?) -> Void)
    func randomNonceString(length: Int) -> String
    func sha256(_ input: String) -> String
    
}

final class AppleService: NSObject {
    private var currentNonce: String?
    var completion: ((Bool, Error?) -> Void)?
}

extension AppleService: AppleServicable {
    func handleAppleIdRequest(completion: @escaping (Bool, Error?) -> Void) {
        let nonce = randomNonceString()
        currentNonce = nonce
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName,
                                   .email]
        request.nonce = sha256(nonce)
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
        self.completion = completion
    }
    
    internal func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0,
                                  count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault,
                                           randomBytes.count,
                                           &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
    
    @available(iOS 13, *)
    internal func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}

extension AppleService: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithReError error: Error) {
#if DEBUG
        print("Sign in with Apple errored: \(error)")
#endif
        //TODO: - call error alert
    }
    
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            
            guard let appleIDToken = appleIDCredential.identityToken else {
#if DEBUG
                print("Unable to fetch identity token")
#endif
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
#if DEBUG
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
#endif
                return
            }
            
            /// Work on latest version of Firebase
//            let credential = OAuthProvider.appleCredential(withIDToken: idTokenString,
//                                                           rawNonce: nonce,
//                                                           fullName: appleIDCredential.fullName)
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if (error != nil) {
#if DEBUG
                    print(error?.localizedDescription)
#endif
                    return
                }
                
                let firstName = appleIDCredential.fullName?.givenName
                let lastName = appleIDCredential.fullName?.familyName
                let email = appleIDCredential.email
                
                self.hasAccount(firstName: firstName,
                                lastName: lastName,
                                email: email,
                                completion: self.completion!)
            }
        }
    }
    
    func hasAccount(firstName: String?,
                    lastName: String?,
                    email: String?,
                    completion: @escaping (Bool, Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        completion(true, nil)
    }
}
