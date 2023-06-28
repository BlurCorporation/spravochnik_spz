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
    let navigationBarTitle: String
    let calculationType: СalculationType
    let valueCoef: [ValueСoefficientModel]
    let choiceCoef: [ChoiceCoefficientModel]
    let defaultCoef: [DefaultCoefficientValueModel]
    let checkboxСoef: [CheckboxСoefficientModel]
    let calculationResult: [CalculationResultModel]
}
