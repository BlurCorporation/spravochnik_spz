//
//  AlertPresenter.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 23.03.2023.
//


// MARK: - AlertPresenterProtocol

protocol AlertPresenterProtocol: AnyObject {
    func viewDidLoad()
}

// MARK: - ALertPresenter

final class AlertPresenter {
    weak var viewController: AlertViewProtocol?
    
    // MARK: PrivateProperties
    private let coefficientType: CoefficientType
    // MARK: - Initializer
    
    init(coefficientType: CoefficientType) {
        self.coefficientType = coefficientType
    }
}

// MARK: - AlertPresenterExtension

extension AlertPresenter: AlertPresenterProtocol {
    func viewDidLoad() {
        switch coefficientType {
            
        case let .value(model):
            break
        case let .choice(model):
            break
        case let .defaultValue(model):
            break
        }
        
    }
    
}


enum CoefficientType {
    case value(model: ValueСoefficientModel)
    case choice(model: ChoiceCoefficientModel)
    case defaultValue(model: DefaultCoefficientValueModel)
}
