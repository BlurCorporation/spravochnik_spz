//
//  OnboardingPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - OnboardingPresenterProtocol
protocol OnboardingPresenterProtocol: AnyObject {
    func getNextVC()
    func setData()
}

// MARK: - OnboardingPresenter
class OnboardingPresenter {
    weak var viewController: OnboardingViewProtocol2?
    
    // MARK: - PrivateProperties
    private let sceneBuildManager: Buildable
    private var onboardingModel = [OnboardingModel]()
    
    // MARK: - Initializer
    init(viewController: OnboardingViewProtocol2,
         sceneBuildManager: Buildable) {
        self.viewController = viewController
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - OnboardingPresenterExtension
extension OnboardingPresenter: OnboardingPresenterProtocol {
    func setData() {
        let model = [OnboardingModel(image: Constants.Images.onboarding1,
                                     title: Constants.TextLabels.onboarding11,
                                     text: Constants.TextLabels.onboarding12),
                     OnboardingModel(image: Constants.Images.onboarding2,
                                     title: Constants.TextLabels.onboarding21,
                                     text: Constants.TextLabels.onboarding22),
                     OnboardingModel(image: Constants.Images.onboarding3,
                                     title: Constants.TextLabels.onboarding31,
                                     text: Constants.TextLabels.onboarding32)]
        viewController?.setData(onboardingData: model)
    }
    
    func getNextVC() {
        let startViewController = sceneBuildManager.buildStartScreen()
        viewController?.navigationController?.pushViewController(startViewController,
                                                                 animated: true)
    }
}
