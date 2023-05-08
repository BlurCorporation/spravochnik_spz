//
//  SavedCalculationCellModel.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 08.02.2023.
//

import UIKit

protocol SavedCalculationsCellModelProtocol {
    var address: String { get }
    var system: String { get }
    var date: String { get }
    var stages: String { get }
    var cost: Float { get }
    var image: UIImage { get }
    var backgroundImage: UIImage  { get }
    var actionHandler: (() -> Void)?  { get }
}

struct SavedCalculationsCellModel: SavedCalculationsCellModelProtocol {
    var address: String
    var system: String
    var date: String
    var stages: String
    var cost: Float
    var image: UIImage
    var backgroundImage: UIImage
    var actionHandler: (() -> Void)?

    static var calculations: [SavedCalculationsCellModel] {
        return [SavedCalculationsCellModel(address: "Москва Кооперативная 20",
                                           system: "Охранная сигнализация",
                                           date: "01.01.2022",
                                           stages: "1-стадийная разработка",
                                           cost: 24_724.04,
                                           image: Constants.Images.securityAlarmIcon,
                                           backgroundImage: Constants.Images.blackBackground),
                SavedCalculationsCellModel(address: "г.Санкт-Петербург ул. Советская дом 20",
                                           system: "Охранная сигнализация периметра",
                                           date: "01.01.2022",
                                           stages: "2-хстадийная разработка",
                                           cost: 89_006.53,
                                           image: Constants.Images.perimetrAlarmIcon,
                                           backgroundImage: Constants.Images.grayBackground),
                SavedCalculationsCellModel(address: "Москва Кооперативная 20",
                                           system: "Система оповещения о пожаре",
                                           date: "01.01.2022",
                                           stages: "2-хстадийная разработка",
                                           cost: 89_006.53,
                                           image: Constants.Images.notificationIcon,
                                           backgroundImage: Constants.Images.brownBackground),
                SavedCalculationsCellModel(address: "Москва Кооперативная 20",
                                           system: "Пожарная сигнализация",
                                           date: "01.01.2022",
                                           stages: "1-стадийная разработка",
                                           cost: 24_724.04,
                                           image: Constants.Images.fireAlarmIcon,
                                           backgroundImage: Constants.Images.blackBackground)
        ]
    }
}
