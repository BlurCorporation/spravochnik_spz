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
    func nextScreenButtonTaped(currentPage: Int)
}

// MARK: - OnboardingPresenter
class OnboardingPresenter {
    weak var viewController: OnboardingViewProtocol?
    
    // MARK: - PrivateProperties
    private let sceneBuildManager: Buildable
    private var onboardingModel: [OnboardingModel]
    
    // MARK: - Initializer
    init(viewController: OnboardingViewProtocol,
         onboardingModel: [OnboardingModel],
         sceneBuildManager: Buildable) {
        self.viewController = viewController
        self.onboardingModel = onboardingModel
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - OnboardingPresenterExtension
extension OnboardingPresenter: OnboardingPresenterProtocol {
    func setData() {
        let model = [OnboardingModel(image: Model.onbording1.image,
                                     title: Model.onbording1.title,
                                     text: Model.onbording1.text),
                     OnboardingModel(image: Model.onbording2.image,
                                     title: Model.onbording2.title,
                                     text: Model.onbording2.text),
                     OnboardingModel(image: Model.onbording3.image,
                                     title: Model.onbording3.title,
                                     text: Model.onbording3.text)]
        viewController?.setData(onboardingData: model)
    }
    
    func nextScreenButtonTaped(currentPage: Int) {
        if currentPage >= 3 {
            getNextVC()
            return
        }
        let indexPath = IndexPath(row: currentPage, section: 0)
        viewController?.scrollToNextScreen(indexPath: indexPath)
    }
    
    func getNextVC() {
        let startViewController = sceneBuildManager.buildStartScreen()
        viewController?.navigationController?.pushViewController(startViewController,
                                                                 animated: true)
    }
}
