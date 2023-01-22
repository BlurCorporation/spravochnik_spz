//
//  ModuleFirefightingSystemResultsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - ModuleFirefightingSystemResultsPresenterProtocol

protocol ModuleFirefightingSystemResultsPresenterProtocol: AnyObject {}

// MARK: - ModuleFirefightingSystemResultsPresenter

final class ModuleFirefightingSystemResultsPresenter {
    weak var viewController: ModuleFirefightingSystemResultsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - ModuleFirefightingSystemResultsPresenterExtension

extension ModuleFirefightingSystemResultsPresenter: ModuleFirefightingSystemResultsPresenterProtocol {}
