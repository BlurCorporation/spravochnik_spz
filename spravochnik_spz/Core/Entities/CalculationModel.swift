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
