//
//  AuthService.swift
//  spravochnik_spz
//
//  Created by Николай Чунихин on 15.05.2023.
//

enum TypeAuth {
    case email
    case google
    case apple
}

protocol AuthServicable {
    func isAuth() -> Bool
    func loginUser(with userRequest: LoginUserRequest,
                   typeAuth: TypeAuth,
                   completion: @escaping (Error?) -> Void)
    func registerUser(with userRequest: RegisterUserRequest?,
                    typeAuth: TypeAuth,
                    completion: @escaping (Bool, Error?) -> Void)
    func logout(completion: @escaping (Error?) -> Void)
}

final class AuthService {
    private let eMailService: EmailServicable
    private let appleService: AppleService
    
    
    init() {
        self.eMailService = EmailService()
        self.appleService = AppleService()
    }
}

extension AuthService: AuthServicable {
    
    func isAuth() -> Bool {
        return self.eMailService.isAuth()
    }
    
    func loginUser(with userRequest: LoginUserRequest,
                   typeAuth: TypeAuth,
                   completion: @escaping (Error?) -> Void) {
        switch typeAuth {
        case .email:
            eMailService.loginUser(with: userRequest,
                                   completion: completion)
        case .google:
            print("google")
        case .apple:
            print("apple")
        }
    }
     
    func registerUser(with userRequest: RegisterUserRequest?,
                    typeAuth: TypeAuth,
                    completion: @escaping (Bool, Error?) -> Void) {
        switch typeAuth {
        case .email:
            self.eMailService.registerUser(with: userRequest!,
                                           completion: completion)
        case .apple:
            appleService.handleAppleIdRequest(completion: completion)
        case .google:
            print("Google")
        }
    }
    
    func logout(completion: @escaping (Error?) -> Void) {
        self.eMailService.logout(completion: completion)
    }
}
