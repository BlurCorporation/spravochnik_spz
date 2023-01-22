//
//  SavedCalculationsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - SavedCalculationsPresenterProtocol

protocol SavedCalculationsPresenterProtocol: AnyObject {}

// MARK: - SavedCalculationsPresenter

final class SavedCalculationsPresenter {
    weak var viewController: SavedCalculationsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - SavedCalculationsPresenterExtension

extension SavedCalculationsPresenter: SavedCalculationsPresenterProtocol {}
