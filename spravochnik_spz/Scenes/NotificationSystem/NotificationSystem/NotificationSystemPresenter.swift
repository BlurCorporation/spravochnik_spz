//
//  NotificationSystemPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - NotificationSystemPresenterProtocol

protocol NotificationSystemPresenterProtocol: AnyObject {}

// MARK: - NotificationSystemPresenter

final class NotificationSystemPresenter {
    weak var viewController: NotificationSystemViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - NotificationSystemPresenterExtension

extension NotificationSystemPresenter: NotificationSystemPresenterProtocol {}
