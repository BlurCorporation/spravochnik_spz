//
//  FirePumpStationPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - FirePumpStationPresenterProtocol

protocol FirePumpStationPresenterProtocol: AnyObject {}

// MARK: - FirePumpStationPresenter

final class FirePumpStationPresenter {
    weak var viewController: FirePumpStationViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - FirePumpStationPresenterExtension

extension FirePumpStationPresenter: FirePumpStationPresenterProtocol {}
