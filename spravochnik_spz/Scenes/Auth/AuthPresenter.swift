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
    func identifireButtonPressed(name: String?,
                                 email: String?,
                                 password: String?,
                                 repeatPassword: String?)
    func appleButtonPressed()
    func googleButtonPressed()
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
    private let defaultsManager: DefaultsManagerable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         authType: AuthType,
         authService: AuthServicable,
         defaultsManager: DefaultsManagerable) {
        self.sceneBuildManager = sceneBuildManager
        self.authType = authType
        self.authService = authService
        self.defaultsManager = defaultsManager
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
            let user = LoginUserRequest(email: email,
                                        password: password)
            
            self.authService.loginUser(with: user,
                                       typeAuth: .email,
                                       viewController: nil) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.defaultsManager.saveObject(true,
                                                for: .isUserAuth)
                
                let isOnbordingWathed = self.defaultsManager.fetchObject(type: Bool.self,
                                                                         for: .isOnbordingWatched) ?? false
                
                if isOnbordingWathed {
                    let tabBarScreen = self.sceneBuildManager.buildTabBarScreen()
                    self.viewController?.navigationController?.pushViewController(tabBarScreen,
                                                                                  animated: true)
                } else {
                    let onbordingScreen = self.sceneBuildManager.buildOnboardingScreen()
                    self.viewController?.navigationController?.pushViewController(onbordingScreen,
                                                                                  animated: true)
                }
            }
            
        case .register:
            guard let name = name else { return }
            let newUser = RegisterUserRequest(username: name,
                                              email: email,
                                              password: password)
            
            self.authService.registerUser(with: newUser) { wasRegistered, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                self.defaultsManager.saveObject(true,
                                                for: .isUserAuth)
                
                let isOnbordingWatched = self.defaultsManager.fetchObject(type: Bool.self,
                                                                          for: .isOnbordingWatched) ?? false
                
                if isOnbordingWatched == false {
                    let onbordingScreen = self.sceneBuildManager.buildOnboardingScreen()
                    self.viewController?.navigationController?.pushViewController(onbordingScreen, animated: true)
                } else {
                    let tabBarScreen = self.sceneBuildManager.buildTabBarScreen()
                    self.viewController?.navigationController?.pushViewController(tabBarScreen, animated: true)
                }
            }
        }
    }
    
    func appleButtonPressed() {
        self.authService.loginUser(with: nil,
                                   typeAuth: .apple,
                                   viewController: nil) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.defaultsManager.saveObject(true,
                                            for: .isUserAuth)
            
            let isOnbordingWatched = self.defaultsManager.fetchObject(type: Bool.self,
                                                                      for: .isOnbordingWatched) ?? false
            
            if isOnbordingWatched == false {
                let onbordingScreen = self.sceneBuildManager.buildOnboardingScreen()
                self.viewController?.navigationController?.pushViewController(onbordingScreen, animated: true)
            } else {
                let tabBarScreen = self.sceneBuildManager.buildTabBarScreen()
                self.viewController?.navigationController?.pushViewController(tabBarScreen, animated: true)
            }
        }
    }
    
    func googleButtonPressed() {
        self.authService.loginUser(with: nil,
                                   typeAuth: .google,
                                   viewController: viewController) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.defaultsManager.saveObject(true, for: .isUserAuth)
            
            let isOnbordingWatched = self.defaultsManager.fetchObject(type: Bool.self,
                                                                      for: .isOnbordingWatched) ?? false
            
            if isOnbordingWatched == false {
                let onbordingScreen = self.sceneBuildManager.buildOnboardingScreen()
                self.viewController?.navigationController?.pushViewController(onbordingScreen, animated: true)
            } else {
                let tabBarScreen = self.sceneBuildManager.buildTabBarScreen()
                
                self.viewController?.navigationController?.pushViewController(tabBarScreen, animated: true)
            }
        }
    }
    
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
