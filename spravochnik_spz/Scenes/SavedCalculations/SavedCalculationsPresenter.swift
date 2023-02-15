//
//  SavedCalculationsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - SavedCalculationsPresenterProtocol

protocol SavedCalculationsTablePresenterProtocol: AnyObject {
    func cellSet(object: SavedCalculationsCellModel, cell: SavedCalculationsUITableViewCell, indexPathRow: Int)
    func openCell(image: UIImage)
}

// MARK: - SavedCalculationsPresenter

final class SavedCalculationsTablePresenter {
    weak var viewController: SavedCalculationsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - SavedCalculationsPresenterExtension

extension SavedCalculationsTablePresenter: SavedCalculationsTablePresenterProtocol {
    func cellSet(object: SavedCalculationsCellModel,
                 cell: SavedCalculationsUITableViewCell,
                 indexPathRow: Int) {
        var backgroundImage = UIImage()
        
        switch indexPathRow % 3 {
        case 0:
            backgroundImage = Constants.Images.blackBackground
        case 1:
            backgroundImage = Constants.Images.grayBackground
        case 2:
            backgroundImage = Constants.Images.brownBackground
        default:
            backgroundImage = Constants.Images.blackBackground
        }
        
        cell.set(object: object, backgroundImage: backgroundImage)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    func openCell(image: UIImage) {
        var nextViewController = UIViewController()
        
        switch image {
        case Constants.Images.fireAlarmIcon:
            nextViewController = sceneBuildManager.buildFireAlarmSystemResultsScreen()
        case Constants.Images.securityAlarmIcon:
            nextViewController = sceneBuildManager.buildSecurityAlarmSystemResultsScreen()
        case Constants.Images.firePumpIcon:
            nextViewController = sceneBuildManager.buildFirePumpStationResultsScreen()
        case Constants.Images.notificationIcon:
            nextViewController = sceneBuildManager.buildNotificationSystemResultsScreen()
        case Constants.Images.perimetrAlarmIcon:
            nextViewController = sceneBuildManager.buildPerimeterAlarmSystemResultsScreen()
        case Constants.Images.smokeExhaustIcon:
            nextViewController = sceneBuildManager.buildSmokeExhaustSystemResultsScreen()
        case Constants.Images.moduleFirefightingIcon:
            nextViewController = sceneBuildManager.buildModuleFirefightingSystemResultsScreen()
        default:
            nextViewController = sceneBuildManager.buildTabBarScreen()
        }
        
        viewController?.navigationController?.pushViewController(nextViewController,
                                                                 animated: true)
    }
}
