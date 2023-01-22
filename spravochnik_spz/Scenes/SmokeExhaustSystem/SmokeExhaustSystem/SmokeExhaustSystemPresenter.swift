//
//  SmokeExhaustSystemPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - SmokeExhaustSystemPresenterProtocol

protocol SmokeExhaustSystemPresenterProtocol: AnyObject {}

// MARK: - SmokeExhaustSystemPresenter

final class SmokeExhaustSystemPresenter {
    weak var viewController: SmokeExhaustSystemViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - SmokeExhaustSystemPresenterExtension

extension SmokeExhaustSystemPresenter: SmokeExhaustSystemPresenterProtocol {}
