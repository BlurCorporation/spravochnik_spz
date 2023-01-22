//
//  SplashPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - SplashPresenterProtocol

protocol SplashPresenterProtocol: AnyObject {}

// MARK: - SplashPresenter

final class SplashPresenter {
    weak var viewController: SplashViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - SplashPresenterExtension

extension SplashPresenter: SplashPresenterProtocol {}

