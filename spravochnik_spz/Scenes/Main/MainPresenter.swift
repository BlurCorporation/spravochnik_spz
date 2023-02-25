//
//  MainPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - MainPresenterProtocol

protocol MainPresenterProtocol: AnyObject {}

// MARK: - MainPresenter

final class MainPresenter {
    weak var viewController: MainViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - MainPresenterExtension

extension MainPresenter: MainPresenterProtocol {}
