//
//  SceneBuildManager.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import Foundation

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
    func buildAlertScreen(coefficientType: CoefficientType,
                          index: Int,
                          delegate: AlertPresenterDelegate,
                          handler: (() -> Void)?) -> AlertViewController
    func buildCalculationScreen(calculationType: СalculationType) -> CalculationViewController
    func buildResultScreen(resultType: ResultType,
                           navigationBarTitle: String,
                           calculationType: СalculationType,
                           defaulValueCoefficients: [DefaultCoefficientValueModel],
                           valueCoefficients: [ValueСoefficientModel],
                           choiceCoefficients: [ChoiceCoefficientModel],
                           checkboxCoefficients: [CheckboxСoefficientModel]) -> ResultViewController
}

final class SceneBuildManager {
    private let authService: AuthServicable
    private let defaultsManager = DefaultsManager()
    private let firestore = FirebaseService.shared
    private let format = DateFormatter()
    
    init() {
        self.authService = AuthService(defaultsManager: defaultsManager,
                                       firestore: firestore)
    }
}

extension SceneBuildManager: Buildable {
    func buildSplashScreen() -> SplashViewController {
        let viewController = SplashViewController()
        let presenter = SplashPresenter(sceneBuildManager: self,
                                        authService: self.authService)
        
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
        let presenter = AuthPresenter(sceneBuildManager: self,
                                      authType: type,
                                      authService: self.authService,
                                      defaultsManager: defaultsManager)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildResetPasswordScreen(updateDataType: UpdateDataType) -> ResetPasswordViewController {
        let viewController = ResetPasswordViewController()
        let presenter = ResetPasswordPresenter(sceneBuildManager: self,
                                               updateDataType: updateDataType)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildOnboardingScreen() -> OnboardingViewController {
        let viewController = OnboardingViewController()
        let onboardingModel = [OnboardingViewModel]()
        let presenter = OnboardingPresenter(viewController: viewController,
                                            onboardingModel: onboardingModel,
                                            sceneBuildManager: self,
                                            defaultsManager: defaultsManager)
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
        let presenter = SavedCalculationsTablePresenter(sceneBuildManager: self,
                                                        firestore: firestore)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildProfileScreen() -> ProfileViewController {
        let viewController = ProfileViewController()
        let presenter = ProfilePresenter(sceneBuildManager: self,
                                         authService: self.authService)
        
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
    
    func buildResultScreen(resultType: ResultType,
                           navigationBarTitle: String,
                           calculationType: СalculationType,
                           defaulValueCoefficients: [DefaultCoefficientValueModel],
                           valueCoefficients: [ValueСoefficientModel],
                           choiceCoefficients: [ChoiceCoefficientModel],
                           checkboxCoefficients: [CheckboxСoefficientModel]) -> ResultViewController {
        let viewController = ResultViewController()
        let calculationService = CalculationService()
        let presenter = ResultPresenter(sceneBuildManager: self,
                                        resultType: resultType,
                                        calculationService: calculationService,
                                        firestore: firestore,
                                        calculationType: calculationType,
                                        navigationBarTitle: navigationBarTitle,
                                        defaulValueCoefficients: defaulValueCoefficients,
                                        valueCoefficients: valueCoefficients,
                                        choiceCoefficients: choiceCoefficients,
                                        checkboxCoefficients: checkboxCoefficients,
                                        format: format)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildAlertScreen(coefficientType: CoefficientType,
                          index: Int,
                          delegate: AlertPresenterDelegate,
                          handler: (() -> Void)?) -> AlertViewController {
        let viewController = AlertViewController()
        let presenter = AlertPresenter(coefficientType: coefficientType, index: index)
        presenter.changeRightHandler(handler: handler)
        viewController.presenter = presenter
        
        presenter.viewController = viewController
        presenter.delegate = delegate
        return viewController
    }
}

