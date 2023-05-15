//
//  String.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 12.05.2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
