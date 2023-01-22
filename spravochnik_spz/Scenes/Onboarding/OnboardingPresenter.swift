//
//  OnboardingPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - OnboardingPresenterProtocol

protocol OnboardingPresenterProtocol: AnyObject {}

// MARK: - OnboardingPresenter

final class OnboardingPresenter {
    weak var viewController: OnboardingViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - OnboardingPresenterExtension

extension OnboardingPresenter: OnboardingPresenterProtocol {}
