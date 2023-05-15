//
//  MainCollectionViewModel.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 27.02.2023.
//

import UIKit

struct MainCollectionViewModel {
    var backgroundColor: UIColor
    var typeImage: UIImage
    var title: String
    
    static var cells: [MainCollectionViewModel] {
        return [MainCollectionViewModel(backgroundColor: Constants.Colors.darkCellColor,
                                        typeImage: Constants.Images.securityAlarmIcon,
                                        title: "securityAlarmText".localized),
                MainCollectionViewModel(backgroundColor: Constants.Colors.grayCellColor,
                                        typeImage: Constants.Images.perimetrAlarmIcon,
                                        title: "perimetrAlarmText".localized),
                MainCollectionViewModel(backgroundColor: Constants.Colors.yellowCellColor,
                                        typeImage: Constants.Images.notificationIcon,
                                        title: "notificationText".localized),
                MainCollectionViewModel(backgroundColor: Constants.Colors.darkCellColor,
                                        typeImage: Constants.Images.fireAlarmIcon,
                                        title: "fireAlarmText".localized),
                MainCollectionViewModel(backgroundColor: Constants.Colors.grayCellColor,
                                        typeImage: Constants.Images.smokeExhaustIcon,
                                        title: "smokeExhaustText".localized),
                MainCollectionViewModel(backgroundColor: Constants.Colors.yellowCellColor,
                                        typeImage: Constants.Images.moduleFirefightingIcon,
                                        title: "moduleFirefightingText".localized),
                MainCollectionViewModel(backgroundColor: Constants.Colors.darkCellColor,
                                        typeImage: Constants.Images.firePumpIcon,
                                        title: "firePumpText".localized),
        ]
    }
}
