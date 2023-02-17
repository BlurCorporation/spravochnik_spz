//
//  ResetPasswordPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - ResetPasswordPresenterProtocol

protocol ResetPasswordPresenterProtocol: AnyObject {}

// MARK: - ResetPasswordPresenter

final class ResetPasswordPresenter {
    weak var viewController: ResetPasswordViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - ResetPasswordPresenterExtension

extension ResetPasswordPresenter: ResetPasswordPresenterProtocol {}
