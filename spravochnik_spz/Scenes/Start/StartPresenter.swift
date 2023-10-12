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
    func demoButtonPressed()
}

// MARK: - StartPresenter

final class StartPresenter {
    weak var viewController: StartViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let defaultsManager: DefaultsManagerable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         defaultsManager: DefaultsManagerable) {
        self.sceneBuildManager = sceneBuildManager
        self.defaultsManager = defaultsManager
    }
}

//MARK: - StartPresenterExtension

extension StartPresenter: StartPresenterProtocol {
    func demoButtonPressed() {
        defaultsManager.saveObject(false, for: .isFullMode)
        let isOnbordingWathed = self.defaultsManager.fetchObject(type: Bool.self,
                                                                 for: .isOnbordingWatched) ?? false
        if isOnbordingWathed {
            let mainScreen = self.sceneBuildManager.buildMainScreen()
            self.viewController?.navigationController?.pushViewController(mainScreen,
                                                                          animated: true)
        } else {
            let onbordingScreen = self.sceneBuildManager.buildOnboardingScreen()
            self.viewController?.navigationController?.pushViewController(onbordingScreen,
                                                                          animated: true)
        }
    }
    
    func loginButtonPressed() {
        defaultsManager.saveObject(true, for: .isFullMode)
        let authViewController = sceneBuildManager.buildAuthScreen(type: .auth)
        viewController?.navigationController?.pushViewController(authViewController,
                                                                 animated: true)
    }
    
    func registerButtonPressed() {
        defaultsManager.saveObject(true, for: .isFullMode)
        let registerViewController = sceneBuildManager.buildAuthScreen(type: .register)
        viewController?.navigationController?.pushViewController(registerViewController,
                                                                 animated: true)
    }
}
