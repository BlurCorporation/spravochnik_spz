//
//  MainPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - MainPresenterProtocol

protocol MainPresenterProtocol: AnyObject {
    func cellSet(object: MainCollectionViewModel,
                 cell: MainCollectionViewCell)
    func helpButtonPressed()
    func openCalculationCellSelected(index: Int)
}

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

extension MainPresenter: MainPresenterProtocol {
    func cellSet(object: MainCollectionViewModel,
                 cell: MainCollectionViewCell) {
        cell.set(object: object)
    }
    
    func helpButtonPressed() {
        print(#function)
    }
    
    func openCalculationCellSelected(index: Int) {
        switch index {
        case 0:
            let securityAlarmViewController = sceneBuildManager.buildCalculationScreen(calculationType: .securityAlarm)
            viewController?.navigationController?.pushViewController(securityAlarmViewController,
                                                                     animated: true)
        case 1:
            let perimeterSecurityAlarmViewController = sceneBuildManager.buildCalculationScreen(calculationType: .perimeterSecurityAlarm)
            viewController?.navigationController?.pushViewController(perimeterSecurityAlarmViewController,
                                                                     animated: true)
        case 2:
            let fireWarningSystemViewController = sceneBuildManager.buildCalculationScreen(calculationType: .fireWarningSystem)
            viewController?.navigationController?.pushViewController(fireWarningSystemViewController,
                                                                     animated: true)
        case 3:
            let fireAlarmSystemViewController = sceneBuildManager.buildCalculationScreen(calculationType: .fireAlarmSystem)
            viewController?.navigationController?.pushViewController(fireAlarmSystemViewController,
                                                                     animated: true)
        case 4:
            let smokeRemovalControlSystemViewController = sceneBuildManager.buildCalculationScreen(calculationType: .smokeRemovalControlSystem)
            viewController?.navigationController?.pushViewController(smokeRemovalControlSystemViewController,
                                                                     animated: true)
        case 5:
            let modularFireExtinguishingSystemsViewController = sceneBuildManager.buildCalculationScreen(calculationType: .modularFireExtinguishingSystems)
            viewController?.navigationController?.pushViewController(modularFireExtinguishingSystemsViewController,
                                                                     animated: true)
        default:
            let pumpingStationsOfFireExtinguishingInstallationsViewController = sceneBuildManager.buildCalculationScreen(calculationType: .pumpingStationsOfFireExtinguishingInstallations)
            viewController?.navigationController?.pushViewController(pumpingStationsOfFireExtinguishingInstallationsViewController,
                                                                     animated: true)
        }
    }
}
