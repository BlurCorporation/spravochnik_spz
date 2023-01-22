//
//  FireAlarmSystemResultsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - FireAlarmSystemResultsPresenterProtocol

protocol FireAlarmSystemResultsPresenterProtocol: AnyObject {}

// MARK: - FireAlarmSystemResultsPresenter

final class FireAlarmSystemResultsPresenter {
    weak var viewController: FireAlarmSystemResultsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - FireAlarmSystemResultsPresenterExtension

extension FireAlarmSystemResultsPresenter: FireAlarmSystemResultsPresenterProtocol {}
