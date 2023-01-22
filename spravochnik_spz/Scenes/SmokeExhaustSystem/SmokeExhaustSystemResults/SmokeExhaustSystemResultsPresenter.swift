//
//  SmokeExhaustSystemResultsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - SmokeExhaustSystemResultsPresenterProtocol

protocol SmokeExhaustSystemResultsPresenterProtocol: AnyObject {}

// MARK: - SmokeExhaustSystemResultsPresenter

final class SmokeExhaustSystemResultsPresenter {
    weak var viewController: SmokeExhaustSystemResultsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - SmokeExhaustSystemResultsPresenterExtension

extension SmokeExhaustSystemResultsPresenter: SmokeExhaustSystemResultsPresenterProtocol {}
