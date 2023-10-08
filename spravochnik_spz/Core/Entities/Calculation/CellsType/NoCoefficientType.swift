//
//  Test.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 25.02.2023.
//

protocol NoCoefficientModelProtocol {
    var title: String { get }
    var leftButton: String { get }
    var rightButton: String { get }
    var rightButtonHandler: (() -> Void)? { get }
}

struct NoСoefficientModel: NoCoefficientModelProtocol  {
    var title: String
    var leftButton: String
    var rightButton: String
    var rightButtonHandler: (() -> Void)?
    
    init(title: String, leftButton: String, rightButton: String, rightButtonHandler: (() -> Void)?) {
        self.title = title
        self.leftButton = leftButton
        self.rightButton = rightButton
        self.rightButtonHandler = rightButtonHandler
    }
}
