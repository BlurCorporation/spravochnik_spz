//
//  StartPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - StartPresenterProtocol

protocol StartPresenterProtocol: AnyObject {
    func loginButtonPressed()
    func registerButtonPressed()
}

// MARK: - StartPresenter

final class StartPresenter {
    weak var viewController: StartViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - StartPresenterExtension

extension StartPresenter: StartPresenterProtocol {
    func loginButtonPressed() {
        let authViewController = sceneBuildManager.buildAuthScreen()
        viewController?.navigationController?.pushViewController(authViewController,
                                                                 animated: true)
    }
    
    func registerButtonPressed() {
        let registerViewController = sceneBuildManager.buildRegisterScreen()
        viewController?.navigationController?.pushViewController(registerViewController,
                                                                 animated: true)
    }
}
