//
//  ResultPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: -  ResultPresenterProtocol

protocol  ResultPresenterProtocol: AnyObject {}

// MARK: -  ResultPresenter

final class  ResultPresenter {
    weak var viewController:  ResultViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: -  ResultPresenterExtension

extension  ResultPresenter:  ResultPresenterProtocol {}
