//
//  DefaultCoefficientValueType.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 26.03.2023.
//

enum DefaultCoefficientValueType {
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

struct DefaultCoefficientValueModel {
    let type: DefaultCoefficientValueType
}

struct DefaultCoefficientValueViewModel {
    let title: String
    let value: Double
    var delegate: DefaultValueCoefficientTableViewCellDelegate?
}
