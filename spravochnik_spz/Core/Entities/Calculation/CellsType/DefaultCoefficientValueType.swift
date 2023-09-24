//
//  DefaultCoefficientValueType.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 26.03.2023.
//

enum DefaultCoefficientValueType: Codable {
    case inflationRate
    
    var title: String {
        switch self {
        case .inflationRate:
            return "Коэффициент инфляции"
        }
    }
    
    var defaultValue: Double {
        switch self {
        case .inflationRate:
            return 37.59
        }
    }
}

struct DefaultCoefficientValueModel: Codable {
    let type: DefaultCoefficientValueType
    let value: Double?
    
    init(type: DefaultCoefficientValueType,
         value: Double? = nil) {
        self.type = type
        self.value = value
    }
}

struct DefaultCoefficientValueViewModel {
    let title: String
    let value: Double
    var delegate: DefaultValueCoefficientTableViewCellDelegate?
}
