//
//  AuthService.swift
//  spravochnik_spz
//
//  Created by Николай Чунихин on 30.03.2023.
//

enum TypeAuth {
    case email
    case google
    case apple
}


protocol AuthServicable {
    func isAuth() -> Bool
    func loginUser(with userRequest: LoginUserRequest, typeAuth: TypeAuth, completion: @escaping (Error?) -> Void)
    func registUser(with userRequest: RegisterUserRequest, typeAuth: TypeAuth, completion: @escaping (Bool, Error?) -> Void)
    func logout(completion: @escaping (Error?) -> Void)
}

final class AuthService {
    
    private let eMailService: EmailServicable
    private let googleService: GoogleServicable
    private let appleService: AppleServicable
    
    init(eMailService: EmailServicable, googleService: GoogleServicable, appleService: AppleServicable) {
        self.eMailService = eMailService
        self.googleService = googleService
        self.appleService = appleService
    }
    
}

extension AuthService: AuthServicable {
    
    func isAuth() -> Bool {
        return self.eMailService.isAuth()
    }
    
    func loginUser(with userRequest: LoginUserRequest, typeAuth: TypeAuth, completion: @escaping (Error?) -> Void) {
        switch typeAuth {
        case .email:
            eMailService.loginUser(with: userRequest,  completion: completion)
        case .google:
            print("google")
        case .apple:
            print("apple")
        }
        
    }
    
    
    /// Метод для регистрации пользователя
    /// - Parameters:
    ///   - userRequest: Информация о пользователе
    ///   - completion: Завершение с 2-мя типами данных
    ///   - Bool: Определяется, если пользователь был зарегистрирован и сохранён в базу данных
    ///   - Error?: Опциональная ошибка
    func registUser(with userRequest: RegisterUserRequest, typeAuth: TypeAuth, completion: @escaping (Bool, Error?) -> Void) {
        
        switch typeAuth {
        case .email:
            self.eMailService.registUser(with: userRequest, completion: completion)
        case .apple:
            print("Apple")
        case .google:
            print("Google")
        }
        
        
        
    }
    
    func logout(completion: @escaping (Error?) -> Void) {
        self.eMailService.logout(completion: completion)
        
    }
}
