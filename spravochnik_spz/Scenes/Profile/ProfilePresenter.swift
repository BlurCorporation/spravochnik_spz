//
//  ProfilePresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - ProfilePresenterProtocol

protocol ProfilePresenterProtocol: AnyObject {}

// MARK: - ProfilePresenter

final class ProfilePresenter {
    weak var viewController: ProfileViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - ProfilePresenterExtension

extension ProfilePresenter: ProfilePresenterProtocol {}
