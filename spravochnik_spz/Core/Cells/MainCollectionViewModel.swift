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
                                        title: Constants.alarmTypesText.securityAlarmText),
                MainCollectionViewModel(backgroundColor: Constants.Colors.grayCellColor,
                                        typeImage: Constants.Images.perimetrAlarmIcon,
                                        title: Constants.alarmTypesText.perimetrAlarmText),
                MainCollectionViewModel(backgroundColor: Constants.Colors.yellowCellColor,
                                        typeImage: Constants.Images.notificationIcon,
                                        title: Constants.alarmTypesText.notificationText),
                MainCollectionViewModel(backgroundColor: Constants.Colors.darkCellColor,
                                        typeImage: Constants.Images.fireAlarmIcon,
                                        title: Constants.alarmTypesText.fireAlarmText),
                MainCollectionViewModel(backgroundColor: Constants.Colors.grayCellColor,
                                        typeImage: Constants.Images.smokeExhaustIcon,
                                        title: Constants.alarmTypesText.smokeExhaustText),
                MainCollectionViewModel(backgroundColor: Constants.Colors.yellowCellColor,
                                        typeImage: Constants.Images.moduleFirefightingIcon,
                                        title: Constants.alarmTypesText.moduleFirefightingText),
                MainCollectionViewModel(backgroundColor: Constants.Colors.darkCellColor,
                                        typeImage: Constants.Images.firePumpIcon,
                                        title: Constants.alarmTypesText.firePumpText),
        ]
    }
}
