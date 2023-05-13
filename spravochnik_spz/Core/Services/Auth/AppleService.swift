//
//  AppleService.swift
//  spravochnik_spz
//
//  Created by Николай Чунихин on 12.05.2023.
//

import Foundation

protocol AppleServicable {
    func login()
    func register()
}

final class AppleService {}

extension AppleService: AppleServicable {
    func login() {
        //
    }
    
    func register() {
        //
    }
}
