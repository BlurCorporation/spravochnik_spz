//
//  SplashPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - SplashPresenterProtocol

import UIKit

protocol SplashPresenterProtocol: AnyObject {
    func viewDidLoad()
}

// MARK: - SplashPresenter

final class SplashPresenter {
    weak var viewController: SplashViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let authService: AuthServicable
    private let defaultsManager: DefaultsManagerable
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         authService: AuthServicable,
         defaultsManager: DefaultsManagerable) {
        self.sceneBuildManager = sceneBuildManager
        self.authService = authService
        self.defaultsManager = defaultsManager
    }
}

//MARK: - SplashPresenterExtension

extension SplashPresenter: SplashPresenterProtocol {
    func viewDidLoad() {
        let rootViewController = UINavigationController(
            rootViewController: self.authService.isAuth()
            ? self.sceneBuildManager.buildTabBarScreen()
            : self.sceneBuildManager.buildStartScreen()
        )
        UIApplication.shared.windows.first?.rootViewController = rootViewController
    }
}
