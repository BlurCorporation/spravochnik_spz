//
//  ChoiceСoefficientType.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 26.03.2023.
//

enum ChoiceСoefficientType: Codable {
    case numberOfLinesOfDefence
    case terrain
    case typeOfNotificationSystem
    case numberOfFirePumpGroups
    
    var title: String {
        switch self {
        case .numberOfLinesOfDefence:
            return "Количество рубежей защиты"
        case .terrain:
            return "Рельеф местности"
        case .typeOfNotificationSystem:
            return "Тип системы оповещения"
        case .numberOfFirePumpGroups:
            return "Кол-во групп пожарных насосов, дозаторов или устройств введения пенообразующих веществ"
        }
    }
    
    var items: [ChoiceСoefficientItemsModel] {
        switch self {
        case .numberOfLinesOfDefence:
            return []
        case .terrain:
            return []
        case .typeOfNotificationSystem:
            return []
        case .numberOfFirePumpGroups:
            return []
        }
    }
    
    var descrp: String {
        switch self {
        case .numberOfLinesOfDefence:
            return "шт"
        case .terrain:
            return ""
        case .typeOfNotificationSystem:
            return ""
        case .numberOfFirePumpGroups:
            return "шт"
        }
    }
}

struct ChoiceСoefficientItemsModel {
    let title: String
    let value: Double
}

struct ChoiceCoefficientModel: Codable {
    let type: ChoiceСoefficientType
    var itemIndex: Int
}

struct ChoiceCoefficientViewModel {
    let title: String
    let descrpt: String
    let type: ChoiceСoefficientType
    var delegate: ChoiceCoefficientTypeTableViewCellDelegate?
}
