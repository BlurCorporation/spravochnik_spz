//
//  AuthService.swift
//  spravochnik_spz
//
//  Created by Николай Чунихин on 15.05.2023.
//

import UIKit

enum TypeAuth {
    case email
    case google
    case apple
}

protocol AuthServicable {
    func isAuth() -> Bool
    func loginUser(with userRequest: LoginUserRequest?,
                   typeAuth: TypeAuth,
                   viewController: UIViewController?,
                   completion: @escaping (Error?) -> Void)
    func registerUser(with userRequest: RegisterUserRequest?,
                    typeAuth: TypeAuth,
                    completion: @escaping (Bool, Error?) -> Void)
    func logout(completion: @escaping (Error?) -> Void)
}

final class AuthService {
    private let eMailService: EmailServicable
    private let appleService: AppleServicable
    private let defaultsManager: DefaultsManagerable
    
    
    private let googleProvider: GoogleProviderable
    
    init(defaultsManager: DefaultsManagerable) {
        self.eMailService = EmailService()
        self.appleService = AppleService()
        self.googleProvider = GoogleProvider()
        self.defaultsManager = defaultsManager
    }
}

extension AuthService: AuthServicable {
    
    func isAuth() -> Bool {
        defaultsManager.fetchObject(type: Bool.self,
                                    for: .isUserAuth) ?? false
    }
    
    func loginUser(with userRequest: LoginUserRequest?,
                   typeAuth: TypeAuth,
                   viewController: UIViewController?,
                   completion: @escaping (Error?) -> Void) {
        switch typeAuth {
        case .email:
            eMailService.loginUser(with: userRequest!,
                                   completion: completion)
        case .google:
            googleProvider.signIn(completion: completion,
                                  viewController: viewController!)
        case .apple:
            print("apple")
        }
    }
     
    func registerUser(with userRequest: RegisterUserRequest?,
                    typeAuth: TypeAuth,
                    completion: @escaping (Bool, Error?) -> Void) {
        switch typeAuth {
        case .email:
            guard let userRequest = userRequest else { return }
            self.eMailService.registerUser(with: userRequest,
                                           completion: completion)
        case .apple:
            appleService.handleAppleIdRequest(completion: completion)
        case .google:
            print("Google")
        }
    }
    
    func logout(completion: @escaping (Error?) -> Void) {
        self.eMailService.logout(completion: completion)
        self.defaultsManager.saveObject(false, for: .isUserAuth)
    }
}
