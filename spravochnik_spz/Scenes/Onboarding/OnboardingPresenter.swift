//
//  OnboardingPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - OnboardingPresenterProtocol
protocol OnboardingPresenterProtocol: AnyObject {
    func viewDidLoad()
    func getNextVC()
    func nextScreenButtonTaped(currentPage: Int)
}

// MARK: - OnboardingPresenter
class OnboardingPresenter {
    weak var viewController: OnboardingViewProtocol?
    
    // MARK: - PrivateProperties
    private let sceneBuildManager: Buildable
    private var onboardingModel: [OnboardingViewModel]
    
    // MARK: - Initializer
    init(viewController: OnboardingViewProtocol,
         onboardingModel: [OnboardingViewModel],
         sceneBuildManager: Buildable) {
        self.viewController = viewController
        self.onboardingModel = onboardingModel
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - OnboardingPresenterExtension
extension OnboardingPresenter: OnboardingPresenterProtocol {
    func viewDidLoad() {
        viewController?.setData(onboardingData: self.setData())
    }
    
    func nextScreenButtonTaped(currentPage: Int) {
        if currentPage >= 3 {
            getNextVC()
            return
        }
        let indexPath = IndexPath(row: currentPage,
                                  section: 0)
        viewController?.scrollToNextScreen(indexPath: indexPath)
    }
    
    func getNextVC() {
        let startViewController = sceneBuildManager.buildStartScreen()
        viewController?.navigationController?.pushViewController(startViewController,
                                                                 animated: true)
    }
}

extension OnboardingPresenter {
    private func setData() -> [OnboardingViewModelProtocol] {
        var model: [OnboardingViewModelProtocol] = [OnboardingViewModel]()
        OnboardingViewModel.makeModel.forEach({ oneScreen in
            model.append(OnboardingViewModel(image: oneScreen.image,
                                             title: oneScreen.title,
                                             text: oneScreen.text))
        })
        return model
    }
}
