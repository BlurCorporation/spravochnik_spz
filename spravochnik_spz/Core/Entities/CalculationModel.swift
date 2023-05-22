//
//  CalculationModel.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 20.05.2023.
//

import Foundation

struct CalculationModel: Codable {
    let param1: String
    let param2: String
    let param3: String
    
    enum CodingKeys: String, CodingKey {
        case param1
        case param2
        case param3
    }
}


struct Calculation {
    let valueCoef: [ValueСoefficientResultModel]
    let choiceCoef: [ChoiceCoefficientResultModel]
    let defaultCoef: [DefaultCoefficientValueResultModel]
    let checkboxСoef: [CheckboxСoefficientResultModel]
    let calculationResultModel: [CalculationResultModel]
}

struct ValueСoefficientResultModel {
    let title: String
    let description: String
    let value: Double
}
struct ChoiceCoefficientResultModel {
    let title: String
    let description: String
    let value: Double
}
struct DefaultCoefficientValueResultModel {
    let title: String
    let value: Double
}
struct CheckboxСoefficientResultModel {
    let title: String
    let value: Double
}
struct CalculationResultModel {
    let title: String
    let value: Double
    let prices: [PriceModel]
}


struct PriceModel {
    let type: PriceModelType
}
struct PriceModelType {
    let title: String
    let value: Double
}

//struct Calculation {
//    ValueСoefficientResultModel: [
//        title: String,
//        description: String,
//        value: Double
//    ],
//    ChoiceCoefficientResultModel: [
//        title: String,
//        description: String,
//        value: Double
//    ],
//    DefaultCoefficientValueResultModel: [
//        title: String,
//        value: Double
//    ],
//    CheckboxСoefficientResultModel: [
//        title: String,
//        value: Double
//    ],
//    CalculationResultModel: [
//        title: String,
//        value: Double,
//        prices: [PriceModel: {type: title: String,
//                              value: Double}
//                ]
//    ],
//}
