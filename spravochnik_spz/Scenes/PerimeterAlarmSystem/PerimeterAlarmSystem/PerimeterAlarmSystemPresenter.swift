//
//  PerimeterAlarmSystemPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: -  PerimeterAlarmSystemPresenterProtocol

protocol  PerimeterAlarmSystemPresenterProtocol: AnyObject {}

// MARK: -  PerimeterAlarmSystemPresenter

final class  PerimeterAlarmSystemPresenter {
    weak var viewController:  PerimeterAlarmSystemViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: -  PerimeterAlarmSystemPresenterExtension

extension  PerimeterAlarmSystemPresenter:  PerimeterAlarmSystemPresenterProtocol {}
