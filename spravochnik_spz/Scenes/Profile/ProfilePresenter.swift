//
//  ProfilePresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit


// MARK: - ProfilePresenterProtocol

protocol ProfilePresenterProtocol: AnyObject {
    func themeButtonPressed()
    func updateDataButtonPressed()
    func conditionButtonPressed()
    func privacyButtonPressed()
    func logoutButtonPressed()
}

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

extension ProfilePresenter: ProfilePresenterProtocol {
    func logoutButtonPressed() {
        let model = NoСoefficientModel(title: "Уверены, что хотите выйти из аккаунта?",
                                       leftButton: "Выйти",
                                       rightButton: "Закрыть")
        let vc = sceneBuildManager.buildAlertScreen(coefficientType: .clear(model: model))
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true)
    }
    
    func themeButtonPressed() {
        print(#function)
    }
    
    func updateDataButtonPressed() {
        let updateDataViewController = sceneBuildManager.buildResetPasswordScreen(updateDataType: .updateData)
        viewController?.navigationController?.pushViewController(updateDataViewController,
                                                                 animated: true)
    }
    
    func conditionButtonPressed() {
        print(#function)
    }
    
    func privacyButtonPressed() {
        print(#function)
    }
}
