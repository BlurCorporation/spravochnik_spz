//
//  CalculationResult.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 13.05.2023.
//

import Foundation

struct CalculationResultModel: Codable {
    let title: TitleType
    let description: String
    let prices: [PriceModel]
}

struct CalculationResultViewModel {
    let title: String
    let description: String
    let prices: [PriceViewModel]
}

enum TitleType: Codable {
    case stageP
    case stageR
    
    var title: String {
        switch self {
        case .stageP:
            return "Стадия П"
        case .stageR:
            return "Стадия Р"
        }
    }
}

struct PriceModel: Codable {
    let type: PriceType
    let value: Double
}

struct PriceViewModel {
    let title: String
    let description: String
    let cost: String
}

enum PriceType: Codable {
    case withVat
    case withoutVat
    
    var title: String {
        switch self {
        case .withVat:
            return "c НДС"
        case .withoutVat:
            return "без НДС"
        }
    }
    
    var carrency: CarrencyType {
        switch self {
        case .withVat:
            return .rub
        case .withoutVat:
            return .rub
        }
    }
}

enum CarrencyType {
    case rub
    
    var title: String {
        switch self {
        case .rub:
            return "руб"
        }
    }
}


struct User {
    let valueCoef: [String]
}
