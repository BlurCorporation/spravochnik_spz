//
//  RegisterPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - RegisterPresenterProtocol

protocol RegisterPresenterProtocol: AnyObject {
    func backButtonPressed()
    func registerButtonPressed()
    func appleButtonPressed()
    func googleButtonPressed()
    func facebookButtonPressed()
    func loginButtonPressed()
}

// MARK: - RegisterPresenter

final class RegisterPresenter {
    weak var viewController: RegisterViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - RegisterPresenterExtension

extension RegisterPresenter: RegisterPresenterProtocol {
    func backButtonPressed() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func registerButtonPressed() {
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
        print(#function)
    }
}
