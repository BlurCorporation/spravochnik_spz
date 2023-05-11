////
////  Test.swift
////  spravochnik_spz
////
////  Created by Swift Learning on 25.02.2023.
////
//
//import Foundation
//
// MARK: - 0

struct NoСoefficientModel {
    var title: String
    var leftButton: String
    var rightButton: String
    
    init(title: String, leftButton: String, rightButton: String) {
        self.title = title
        self.leftButton = leftButton
        self.rightButton = rightButton
    }
}

//
//// MARK: - 1
//enum ValueСoefficientType {
//    case objectArea
//    case lengthOfThePerimeter
//    case numberOfBlockingSections
//    case numberOfProtectedPremises
//    
//    var title: String {
//        switch self {
//        case .objectArea:
//            return "Площадь объекта"
//        case .lengthOfThePerimeter:
//            return "Протяженность периметра объекта"
//        case .numberOfBlockingSections:
//            return "Количество участков блокировки"
//        case .numberOfProtectedPremises:
//            return "Количество защищаемых помещений (направлений)"
//        }
//    }
//    
//    var descrp: String {
//        switch self {
//        case .objectArea:
//            return "м²"
//        case .lengthOfThePerimeter:
//            return "км"
//        case .numberOfBlockingSections:
//            return "шт"
//        case .numberOfProtectedPremises:
//            return "шт"
//        }
//    }
//}
//
//struct ValueСoefficientModel {
//    let type: ValueСoefficientType
//    var value: Double
//    
//    init(type: ValueСoefficientType, value: Double = 0.0) {
//        self.type = type
//        self.value = value
//    }
//}
//
//struct ValueСoefficientViewModel {
//    let title: String
//    let value: Double
//    let descrpt: String
//}
//
//// MARK: - 2
//enum ChoiceСoefficientType {
//    case numberOfLinesOfDefence
//    case terrain
//    case typeOfNotificationSystem
//    case numberOfFirePumpGroups
//    
//    var title: String {
//        switch self {
//        case .numberOfLinesOfDefence:
//            return "Количество рубежей защиты"
//        case .terrain:
//            return "Рельеф местности"
//        case .typeOfNotificationSystem:
//            return "Тип системы оповещения"
//        case .numberOfFirePumpGroups:
//            return "Кол-во групп пожарных насосов, дозаторов или устройств введения пенообразующих веществ"
//        }
//    }
//    
//    var items: [ChoiceСoefficientItemsModel] {
//        switch self {
//        case .numberOfLinesOfDefence:
//            return [.init(title: "1", value: 1), .init(title: "2", value: 1), .init(title: "3", value: 1)]
//        case .terrain:
//            return []
//        case .typeOfNotificationSystem:
//            return []
//        case .numberOfFirePumpGroups:
//            return []
//        }
//    }
//    
//    var descrp: String {
//        switch self {
//        case .numberOfLinesOfDefence:
//            return "шт"
//        case .terrain:
//            return ""
//        case .typeOfNotificationSystem:
//            return ""
//        case .numberOfFirePumpGroups:
//            return "шт"
//        }
//    }
//}
//
//struct ChoiceСoefficientItemsModel {
//    let title: String
//    let value: Double
//}
//
//struct ChoiceCoefficientModel {
//    let type: ChoiceСoefficientType
//    var itemIndex: Int
//}
//
//struct ChoiceCoefficientViewModel {
//    let title: String
//    let descrpt: String
//}
//
//// MARK: - 3
//enum DefaultCoefficientValueType {
//    case inflationRate
//    
//    var title: String {
//        switch self {
//        case .inflationRate:
//            return "Коэффициент инфляции"
//        }
//    }
//    
//    var defaultValue: Double {
//        switch self {
//        case .inflationRate:
//            return 37.59
//        }
//    }
//}
//
//struct DefaultCoefficientValueModel {
//    let type: DefaultCoefficientValueType
//}
//
//struct DefaultCoefficientValueViewModel {
//    let title: String
//    let value: Double
//}
