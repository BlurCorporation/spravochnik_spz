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
    func buildSecurityAlarmSystemScreen() -> SecurityAlarmSystemViewController
    func buildSecurityAlarmSystemResultsScreen() -> SecurityAlarmSystemResultsViewController
    func buildPerimeterAlarmSystemScreen() -> PerimeterAlarmSystemViewController
    func buildPerimeterAlarmSystemResultsScreen() -> PerimeterAlarmSystemResultsViewController
    func buildFireAlarmSystemScreen() -> FireAlarmSystemViewController
    func buildFireAlarmSystemResultsScreen() -> FireAlarmSystemResultsViewController
    func buildNotificationSystemScreen() -> NotificationSystemViewController
    func buildNotificationSystemResultsScreen() -> NotificationSystemResultsViewController
    func buildModuleFirefightingSystemScreen() -> ModuleFirefightingSystemViewController
    func buildModuleFirefightingSystemResultsScreen() -> ModuleFirefightingSystemResultsViewController
    func buildSmokeExhaustSystemScreen() -> SmokeExhaustSystemViewController
    func buildSmokeExhaustSystemResultsScreen() -> SmokeExhaustSystemResultsViewController
    func buildFirePumpStationScreen() -> FirePumpStationViewController
    func buildFirePumpStationResultsScreen() -> FirePumpStationResultsViewController
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
    
    func buildSecurityAlarmSystemScreen() -> SecurityAlarmSystemViewController {
        let viewController = SecurityAlarmSystemViewController()
        let presenter = SecurityAlarmSystemPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildSecurityAlarmSystemResultsScreen() -> SecurityAlarmSystemResultsViewController {
        let viewController = SecurityAlarmSystemResultsViewController()
        let presenter = SecurityAlarmSystemResultsPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildPerimeterAlarmSystemScreen() -> PerimeterAlarmSystemViewController {
        let viewController = PerimeterAlarmSystemViewController()
        let presenter = PerimeterAlarmSystemPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildPerimeterAlarmSystemResultsScreen() -> PerimeterAlarmSystemResultsViewController {
        let viewController = PerimeterAlarmSystemResultsViewController()
        let presenter = PerimeterAlarmSystemResultsPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildFireAlarmSystemScreen() -> FireAlarmSystemViewController {
        let viewController = FireAlarmSystemViewController()
        let presenter = FireAlarmSystemPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildFireAlarmSystemResultsScreen() -> FireAlarmSystemResultsViewController {
        let viewController = FireAlarmSystemResultsViewController()
        let presenter = FireAlarmSystemResultsPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildNotificationSystemScreen() -> NotificationSystemViewController {
        let viewController = NotificationSystemViewController()
        let presenter = NotificationSystemPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildNotificationSystemResultsScreen() -> NotificationSystemResultsViewController {
        let viewController = NotificationSystemResultsViewController()
        let presenter = NotificationSystemResultsPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildModuleFirefightingSystemScreen() -> ModuleFirefightingSystemViewController {
        let viewController = ModuleFirefightingSystemViewController()
        let presenter = ModuleFirefightingSystemPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildModuleFirefightingSystemResultsScreen() -> ModuleFirefightingSystemResultsViewController {
        let viewController = ModuleFirefightingSystemResultsViewController()
        let presenter = ModuleFirefightingSystemResultsPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildSmokeExhaustSystemScreen() -> SmokeExhaustSystemViewController {
        let viewController = SmokeExhaustSystemViewController()
        let presenter = SmokeExhaustSystemPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildSmokeExhaustSystemResultsScreen() -> SmokeExhaustSystemResultsViewController {
        let viewController = SmokeExhaustSystemResultsViewController()
        let presenter = SmokeExhaustSystemResultsPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildFirePumpStationScreen() -> FirePumpStationViewController {
        let viewController = FirePumpStationViewController()
        let presenter = FirePumpStationPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildFirePumpStationResultsScreen() -> FirePumpStationResultsViewController {
        let viewController = FirePumpStationResultsViewController()
        let presenter = FirePumpStationResultsPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}

