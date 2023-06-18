//
//  CalculationModel.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 20.05.2023.
//

import Foundation

struct CalculationModel: Codable {
    let userID: String
    var calcName: String = ""
    let calculation: [Calculation]
}


struct Calculation: Codable {
    let valueCoef: [ValueСoefficientResultModel]
    let choiceCoef: [ChoiceCoefficientResultModel]
    let defaultCoef: [DefaultCoefficientValueResultModel]
    let checkboxСoef: [CheckboxСoefficientResultModel]
    let calculationResult: [CalculationResultModel]
}

struct ValueСoefficientResultModel: Codable {
    let title: String
    let description: String
    let value: Double
}

struct ChoiceCoefficientResultModel: Codable {
    let title: String
    let description: String
    let value: Double
}

struct DefaultCoefficientValueResultModel: Codable {
    let title: String
    let value: Double
}

struct CheckboxСoefficientResultModel: Codable {
    let title: String
    let value: Double
}

struct CalculationResultModel: Codable {
    let title: String
    let value: Double
    let prices: [PriceModel]
}

struct PriceModel: Codable {
    let type: PriceModelType
}

struct PriceModelType: Codable {
    let title: String
    let value: Double
}
