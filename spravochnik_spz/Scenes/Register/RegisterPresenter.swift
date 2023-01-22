//
//  RegisterPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - RegisterPresenterProtocol

protocol RegisterPresenterProtocol: AnyObject {}

// MARK: - RegisterPresenter

final class RegisterPresenter {
    weak var viewController: RegisterViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - RegisterPresenterExtension

extension RegisterPresenter: RegisterPresenterProtocol {}
