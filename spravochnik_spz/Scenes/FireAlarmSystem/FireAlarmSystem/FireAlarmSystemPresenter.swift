//
//  FireAlarmSystemPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - FireAlarmSystemPresenterProtocol

protocol FireAlarmSystemPresenterProtocol: AnyObject {}

// MARK: - FireAlarmSystemPresenter

final class FireAlarmSystemPresenter {
    weak var viewController: FireAlarmSystemViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - FireAlarmSystemPresenterExtension

extension FireAlarmSystemPresenter: FireAlarmSystemPresenterProtocol {}
