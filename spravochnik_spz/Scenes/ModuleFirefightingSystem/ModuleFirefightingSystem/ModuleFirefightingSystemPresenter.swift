//
//  ModuleFirefightingSystemPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - ModuleFirefightingSystemPresenterProtocol

protocol ModuleFirefightingSystemPresenterProtocol: AnyObject {}

// MARK: - ModuleFirefightingSystemPresenter

final class ModuleFirefightingSystemPresenter {
    weak var viewController: ModuleFirefightingSystemViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - ModuleFirefightingSystemPresenterExtension

extension ModuleFirefightingSystemPresenter: ModuleFirefightingSystemPresenterProtocol {}
