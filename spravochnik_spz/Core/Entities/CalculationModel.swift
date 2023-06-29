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
    let address: String
    let date: String
    let stages: String // где хранятся стадии, пока есть только двухстадийная разработка в моделе CheckboxСoefficientModel
    let cost: Double
    let navigationBarTitle: String
    let calculationType: СalculationType // то же, что и system в структуре SavedCalculationsCellModel
    let valueCoef: [ValueСoefficientModel]
    let choiceCoef: [ChoiceCoefficientModel]
    let defaultCoef: [DefaultCoefficientValueModel]
    let checkboxСoef: [CheckboxСoefficientModel]
    let calculationResult: [CalculationResultModel]
}
