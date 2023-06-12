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
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         authService: AuthServicable) {
        self.sceneBuildManager = sceneBuildManager
        self.authService = authService
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
