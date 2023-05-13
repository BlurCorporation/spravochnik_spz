//
//  AuthPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - AuthPresenterProtocol

protocol AuthPresenterProtocol: AnyObject {
    func viewDidLoad()
    func backButtonPressed()
    func identifireButtonPressed(name: String?, email: String?, password: String?, repeatPassword: String?)
    func appleButtonPressed()
    func googleButtonPressed()
    //func facebookButtonPressed()
    func loginButtonPressed()
    func forgotPasswordButtonPressed()
}

// MARK: - AuthPresenter

final class AuthPresenter {
    weak var viewController: AuthViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let authType: AuthType
    private let authService: AuthServicable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         authType: AuthType,
         authService: AuthServicable) {
        self.sceneBuildManager = sceneBuildManager
        self.authType = authType
        self.authService = authService
    }
}

//MARK: - AuthPresenterExtension

extension AuthPresenter: AuthPresenterProtocol {
    func viewDidLoad() {
        authType == .auth
        ? viewController?.setupAuth()
        : viewController?.setupRegister()
    }
    
    func backButtonPressed() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    func identifireButtonPressed(name: String?,
                                 email: String?,
                                 password: String?,
                                 repeatPassword: String?) {
        guard let email = email,
              let password = password else {
            return
        }
        switch authType {
            
        case .auth:
            let user = LoginUserRequest(
                email: email,
                password: password
            )
            
            self.authService.loginUser(with: user,
                                       typeAuth: .email) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
            }
            
            let tabBarScreen = self.sceneBuildManager.buildTabBarScreen()
            self.viewController?.navigationController?.pushViewController(tabBarScreen, animated: true)
            
        case .register:
            guard let name = name else { return }
            let newUser = RegisterUserRequest(
                username: name,
                email: email,
                password: password
            )
            
            self.authService.registUser(with: newUser, typeAuth: .email) { wasRegisterd, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
            }
            let tabBarScreen = self.sceneBuildManager.buildTabBarScreen()
            self.viewController?.navigationController?.pushViewController(tabBarScreen, animated: true)
        }
        
    }
    
    func appleButtonPressed() {
        print(#function)
    }
    
    func googleButtonPressed() {
        print(#function)
    }
    
//    func facebookButtonPressed() {
//        print(#function)
//    }
    
    func loginButtonPressed() {
        if authType == .auth {
            let registerViewController = sceneBuildManager.buildAuthScreen(type: .register)
            viewController?.navigationController?.pushViewController(registerViewController,
                                                                        animated: true)
        } else {
            let authViewController = sceneBuildManager.buildAuthScreen(type: .auth)
            viewController?.navigationController?.pushViewController(authViewController,
                                                                     animated: true)
        }
    }
    
    func forgotPasswordButtonPressed() {
        let resetPasswordViewController = sceneBuildManager.buildResetPasswordScreen(updateDataType: .resetPassword)
        viewController?.navigationController?.pushViewController(resetPasswordViewController,
                                                                 animated: true)
    }
}
