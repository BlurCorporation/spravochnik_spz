//
//  SecurityAlarmSystemPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - SecurityAlarmSystemPresenterProtocol

protocol SecurityAlarmSystemPresenterProtocol: AnyObject {}

// MARK: - SecurityAlarmSystemPresenter

final class SecurityAlarmSystemPresenter {
    weak var viewController: SecurityAlarmSystemViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - SecurityAlarmSystemPresenterExtension

extension SecurityAlarmSystemPresenter: SecurityAlarmSystemPresenterProtocol {}
