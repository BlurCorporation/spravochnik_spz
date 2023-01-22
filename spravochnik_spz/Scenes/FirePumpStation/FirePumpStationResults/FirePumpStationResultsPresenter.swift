//
//  FirePumpStationResultsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - FirePumpStationResultsPresenterProtocol

protocol FirePumpStationResultsPresenterProtocol: AnyObject {}

// MARK: - FirePumpStationResultsPresenter

final class FirePumpStationResultsPresenter {
    weak var viewController: FirePumpStationResultsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - FirePumpStationResultsPresenterExtension

extension FirePumpStationResultsPresenter: FirePumpStationResultsPresenterProtocol {}
