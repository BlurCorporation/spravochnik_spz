//
//  StartPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - StartPresenterProtocol

protocol StartPresenterProtocol: AnyObject {}

// MARK: - StartPresenter

final class StartPresenter {
    weak var viewController: StartViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - StartPresenterExtension

extension StartPresenter: StartPresenterProtocol {}
