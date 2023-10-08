//
//  ResetPasswordPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - ResetPasswordPresenterProtocol

protocol ResetPasswordPresenterProtocol: AnyObject {
    func viewDidLoad()
    func backButtonPressed()
    func topButtonPressed()
    func bottomButtonPressed()
}

// MARK: - ResetPasswordPresenter

final class ResetPasswordPresenter {
    weak var viewController: ResetPasswordViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let updateDataType: UpdateDataType
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         updateDataType: UpdateDataType) {
        self.sceneBuildManager = sceneBuildManager
        self.updateDataType = updateDataType
    }
}

//MARK: - ResetPasswordPresenterExtension

extension ResetPasswordPresenter: ResetPasswordPresenterProtocol {
    func viewDidLoad() {
        switch updateDataType {
        case .resetPassword:
            viewController?.setupResetPassword()
        case .updateData:
            viewController?.setupUpdateData()
        case.updatePassword:
            viewController?.setupUpdatePassword()
        }
    }
    
    func backButtonPressed() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func topButtonPressed() {
        let updatePasswordViewController = sceneBuildManager.buildResetPasswordScreen(updateDataType: .updatePassword)
        viewController?.navigationController?.pushViewController(updatePasswordViewController,
                                                                 animated: true)
    }
    
    func bottomButtonPressed() {
        switch updateDataType {
        case .resetPassword:
            print("Письмо отправлено")
        case .updateData:
            print("Изменения сохранены")
        case.updatePassword:
            print("Пароль обновлен")
        }
    }
}
