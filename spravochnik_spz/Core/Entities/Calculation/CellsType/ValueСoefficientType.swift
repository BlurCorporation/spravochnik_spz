//
//  ValueСoefficientType.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 26.03.2023.
//

enum ValueСoefficientType {
    case objectArea
    case lengthOfThePerimeter
    case numberOfBlockingSections
    case numberOfProtectedPremises
    
    var title: String {
        switch self {
        case .objectArea:
            return "Площадь объекта"
        case .lengthOfThePerimeter:
            return "Протяженность периметра объекта"
        case .numberOfBlockingSections:
            return "Количество участков блокировки"
        case .numberOfProtectedPremises:
            return "Количество защищаемых помещений (направлений)"
        }
    }
    
    var descrp: String {
        switch self {
        case .objectArea:
            return "м²"
        case .lengthOfThePerimeter:
            return "км"
        case .numberOfBlockingSections:
            return "шт"
        case .numberOfProtectedPremises:
            return "шт"
        }
    }
}

struct ValueСoefficientModel {
    let type: ValueСoefficientType
    var value: Double
    
    init(type: ValueСoefficientType,
         value: Double = 0.0) {
        self.type = type
        self.value = value
    }
}

struct ValueСoefficientViewModel {
    let title: String
    let value: Double
    let descrpt: String
    var delegate: ValueCoefficientTableViewCellDelegate?
}
