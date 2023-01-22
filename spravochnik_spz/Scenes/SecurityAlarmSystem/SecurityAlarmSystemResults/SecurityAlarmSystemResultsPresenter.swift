//
//  SecurityAlarmSystemResultsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - SecurityAlarmSystemResultsPresenterProtocol

protocol SecurityAlarmSystemResultsPresenterProtocol: AnyObject {}

// MARK: - SecurityAlarmSystemResultsPresenter

final class SecurityAlarmSystemResultsPresenter {
    weak var viewController: SecurityAlarmSystemResultsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - SecurityAlarmSystemResultsPresenterExtension

extension SecurityAlarmSystemResultsPresenter: SecurityAlarmSystemResultsPresenterProtocol {}
