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
