//
//  SplashPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - SplashPresenterProtocol



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
        
        if self.authService.isAuth() == false {
            let AuthViewController = self.sceneBuildManager.buildAuthScreen(type: .auth)
            self.viewController?.navigationController?.pushViewController(AuthViewController, animated: true)
        } else {
            let tabBarScreen = self.sceneBuildManager.buildTabBarScreen()
            self.viewController?.navigationController?.pushViewController(tabBarScreen, animated: true)
        }
        
//        Auth.auth().addStateDidChangeListener { (auth, user) in
//            if user == nil {
//                let AuthViewController = self.sceneBuildManager.buildAuthScreen(type: .auth)
//                self.viewController?.navigationController?.pushViewController(AuthViewController, animated: true)
//            } else {
//                let tabBarScreen = self.sceneBuildManager.buildTabBarScreen()
//                self.viewController?.navigationController?.pushViewController(tabBarScreen, animated: true)
//            }
//        }
    }
}

