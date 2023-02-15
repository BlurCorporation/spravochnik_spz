//
//  SavedCalculationCellModel.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 08.02.2023.
//

import UIKit

struct SavedCalculationsCellModel {
    var address: String
    var type: String
    var date: String
    var stages: String
    var cost: Float
    var image: UIImage
    
    static var calculations: [SavedCalculationsCellModel] {
        return [SavedCalculationsCellModel(address: "Москва Кооперативная 20",
                                           type: "Охранная сигнализация",
                                           date: "01.01.2022",
                                           stages: "1-стадийная разработка",
                                           cost: 24_724.04,
                                           image: Constants.Images.securityAlarmIcon),
                SavedCalculationsCellModel(address: "г.Санкт-Петербург ул. Советская дом 20",
                                           type: "Охранная сигнализация периметра",
                                           date: "01.01.2022",
                                           stages: "2-хстадийная разработка",
                                           cost: 89_006.53,
                                           image: Constants.Images.perimetrAlarmIcon),
                SavedCalculationsCellModel(address: "Москва Кооперативная 20",
                                           type: "Система оповещения о пожаре",
                                           date: "01.01.2022",
                                           stages: "2-хстадийная разработка",
                                           cost: 89_006.53,
                                           image: Constants.Images.notificationIcon),
                SavedCalculationsCellModel(address: "Москва Кооперативная 20",
                                           type: "Пожарная сигнализация",
                                           date: "01.01.2022",
                                           stages: "1-стадийная разработка",
                                           cost: 24_724.04,
                                           image: Constants.Images.fireAlarmIcon)
        ]
    }
}
