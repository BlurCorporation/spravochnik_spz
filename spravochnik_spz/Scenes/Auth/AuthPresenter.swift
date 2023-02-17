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
    func identifireButtonPressed()
    func appleButtonPressed()
    func googleButtonPressed()
    func facebookButtonPressed()
    func loginButtonPressed()
    func forgotPasswordButtonPressed()
}

// MARK: - AuthPresenter

final class AuthPresenter {
    weak var viewController: AuthViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let authType: AuthType
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         authType: AuthType) {
        self.sceneBuildManager = sceneBuildManager
        self.authType = authType
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
    
    func identifireButtonPressed() {
        print(#function)
    }
    
    func appleButtonPressed() {
        print(#function)
    }
    
    func googleButtonPressed() {
        print(#function)
    }
    
    func facebookButtonPressed() {
        print(#function)
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
        print(#function)
    }
}
