//
//  ChoiceСoefficientResultType.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 13.05.2023.
//

import Foundation

struct ChoiceCoefficientResultModel: Codable {
    let title: String
    let description: String
    let value: Double
}

struct ChoiceCoefficientResultViewModel {
    let title: String
}
