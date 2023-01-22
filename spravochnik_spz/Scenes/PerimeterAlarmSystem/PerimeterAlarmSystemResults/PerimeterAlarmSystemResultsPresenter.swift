//
//  PerimeterAlarmSystemResultsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: -  PerimeterAlarmSystemPresenterProtocol

protocol PerimeterAlarmSystemResultsPresenterProtocol: AnyObject {}

// MARK: - PerimeterAlarmSystemResultsPresenter

final class PerimeterAlarmSystemResultsPresenter {
    weak var viewController: PerimeterAlarmSystemResultsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - PerimeterAlarmSystemResultsPresenterExtension

extension PerimeterAlarmSystemResultsPresenter: PerimeterAlarmSystemResultsPresenterProtocol {}
