//
//  SceneBuildManager.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

protocol Buildable {
    func buildSplashScreen() -> SplashViewController
    func buildStartScreen() -> StartViewController
    func buildAuthScreen(type: AuthType) -> AuthViewController
    func buildResetPasswordScreen(updateDataType: UpdateDataType) -> ResetPasswordViewController
    func buildOnboardingScreen() -> OnboardingViewController
    func buildTabBarScreen() -> TabBarController
    func buildMainScreen() -> MainViewController
    func buildSavedCalculationsScreen() -> SavedCalculationsViewController
    func buildProfileScreen() -> ProfileViewController
    func buildCalculationScreen(calculationType: СalculationType) -> CalculationViewController
    func buildResultScreen() -> ResultViewController
}

final class SceneBuildManager {}

extension SceneBuildManager: Buildable {
    func buildSplashScreen() -> SplashViewController {
        let viewController = SplashViewController()
        let presenter = SplashPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildStartScreen() -> StartViewController {
        let viewController = StartViewController()
        let presenter = StartPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildAuthScreen(type: AuthType) -> AuthViewController {
        let viewController = AuthViewController()
        let presenter = AuthPresenter(sceneBuildManager: self, authType: type)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildResetPasswordScreen(updateDataType: UpdateDataType) -> ResetPasswordViewController {
        let viewController = ResetPasswordViewController()
        let presenter = ResetPasswordPresenter(sceneBuildManager: self, updateDataType: updateDataType)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildOnboardingScreen() -> OnboardingViewController {
        let viewController = OnboardingViewController()
        let presenter = OnboardingPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildTabBarScreen() -> TabBarController {
        let viewController = TabBarController()
        
        return viewController
    }
    
    func buildMainScreen() -> MainViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildSavedCalculationsScreen() -> SavedCalculationsViewController {
        let viewController = SavedCalculationsViewController()
        let presenter = SavedCalculationsTablePresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildProfileScreen() -> ProfileViewController {
        let viewController = ProfileViewController()
        let presenter = ProfilePresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildCalculationScreen(calculationType: СalculationType) -> CalculationViewController {
        let viewController = CalculationViewController()
        let presenter = CalculationPresenter(sceneBuildManager: self,
                                             calculationType: calculationType)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildResultScreen() -> ResultViewController {
        let viewController = ResultViewController()
        let presenter = ResultPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}

