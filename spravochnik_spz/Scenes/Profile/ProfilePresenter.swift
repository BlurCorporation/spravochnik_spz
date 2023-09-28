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
    func deleteAccountButtonPressed()
    func logoutButtonPressed()
    func viewDidLoad()
}

// MARK: - ProfilePresenter

final class ProfilePresenter {
    weak var viewController: ProfileViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let authService: AuthServicable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         authService: AuthServicable) {
        self.sceneBuildManager = sceneBuildManager
        self.authService = authService
    }
    
    // MARK: - PrivateMethods
    private func routeToAlert(coefficientType: CoefficientType, index: Int) {
        let vc = sceneBuildManager.buildAlertScreen(coefficientType: coefficientType, index: index, delegate: self, handler: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true)
    }
}

//MARK: - ProfilePresenterExtension

extension ProfilePresenter: ProfilePresenterProtocol {
    func viewDidLoad() {
        viewController?.changeUsernameLabel(authService.getUserName())
    }
    
    func logoutButtonPressed() {
        let model = NoСoefficientModel(title: "Уверены, что хотите выйти из аккаунта?",
                                       leftButton: "Закрыть",
                                       rightButton: "Выйти",
                                       rightButtonHandler: {
            self.authService.logout { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                print("exit")
            }
            let startViewController = self.sceneBuildManager.buildStartScreen()
            let rootViewController = UINavigationController.init(rootViewController: startViewController)
            UIApplication.shared.windows.first?.rootViewController = rootViewController
        })
        let vc = sceneBuildManager.buildAlertScreen(coefficientType: .clear(model: model), index: .zero, delegate: self, handler: model.rightButtonHandler)
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
    
    func deleteAccountButtonPressed() {
        let model = NoСoefficientModel(title: "Уверены, что хотите удалить аккаунт?",
                                       leftButton: "Оставить",
                                       rightButton: "Удалить",
                                       rightButtonHandler: {
            self.authService.deleteUser { result in
                switch result {
                case .success(_):
                    let startViewController = self.sceneBuildManager.buildStartScreen()
                    let rootViewController = UINavigationController.init(rootViewController: startViewController)
                    UIApplication.shared.windows.first?.rootViewController = rootViewController
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
            let startViewController = self.sceneBuildManager.buildStartScreen()
            let rootViewController = UINavigationController.init(rootViewController: startViewController)
            UIApplication.shared.windows.first?.rootViewController = rootViewController
        })
        let vc = sceneBuildManager.buildAlertScreen(coefficientType: .clear(model: model), index: .zero, delegate: self, handler: model.rightButtonHandler)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true)
    }
}

extension ProfilePresenter: AlertPresenterDelegate {
    func saveButtonPressed(type: CoefficientType, index: Int) {
//        switch type {
//        case .clear:
//            self.authService.logout { error in
//                if let error = error {
//                    print(error.localizedDescription)
//                    return
//                }
//                print("exit")
//            }
//            let startViewController = self.sceneBuildManager.buildStartScreen()
//            let rootViewController = UINavigationController.init(rootViewController: startViewController)
//            UIApplication.shared.windows.first?.rootViewController = rootViewController
//        default:
//            break
//        }
    }
}
