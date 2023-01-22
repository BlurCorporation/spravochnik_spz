//
//  NotificationSystemResultsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - NotificationSystemResultsPresenterProtocol

protocol NotificationSystemResultsPresenterProtocol: AnyObject {}

// MARK: - NotificationSystemResultsPresenter

final class NotificationSystemResultsPresenter {
    weak var viewController: NotificationSystemResultsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - NotificationSystemResultsPresenterExtension

extension NotificationSystemResultsPresenter: NotificationSystemResultsPresenterProtocol {}
