//
//  AlertPresenter.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 23.03.2023.
//


// MARK: - AlertPresenterProtocol

protocol AlertPresenterProtocol: AnyObject {
    func viewDidLoad()
    func rightButtonPressed()
}

// MARK: - ALertPresenter

final class AlertPresenter {
    weak var viewController: AlertViewProtocol?
    
    // MARK: PrivateProperties
    private let coefficientType: CoefficientType
//    private var dataSource: [String]
    // MARK: - Initializer
    
    init(coefficientType: CoefficientType) {
        self.coefficientType = coefficientType
    }
}

// MARK: - AlertPresenterExtension

extension AlertPresenter: AlertPresenterProtocol {
    func viewDidLoad() {
        switch coefficientType {
        case let .clear(model):
            let title = model.title
            let leftButtonTitle = model.leftButton
            let rightButtonTittle = model.rightButton
            viewController?.updateUIForClear(title: title,
                                             leftButtonTitle: leftButtonTitle,
                                             rightButtonTitle: rightButtonTittle)
        case let .value(model):
            let title = model.type.title
            viewController?.updateUIForVlaue(title: title,
                                             value: model.value)
        case let .choice(model):
            let axis = model.type
            let title = model.type.title
            var collectionViewDataSource = [String]()
            self.viewController?.update(dataSource: self.makeData(axis))
            
            let numOfItems = collectionViewDataSource.count
            viewController?.updateUIForChoice(title: title,
                                              axis: axis,
                                              numOfItems: 0)
        case let .defaultValue(model, value):
            let title = model.type.title
            viewController?.updateUIForVlaue(title: title, value: value)
        }
    }
    
    private func makeData(_ axis: ChoiceСoefficientType) -> [String] {
        switch axis {
        case .numberOfLinesOfDefence:
            return ["1", "2", "3"]
        case .terrain:
            return ["Нормальный (перепад менее 1,5 м)", "Холмистый (перепад более 1,5 м)", "Гористый"]
        case .typeOfNotificationSystem:
            return ["1", "2", "3", "4", "5"]
        case .numberOfFirePumpGroups:
            return ["1", "2", "3", "4"]
        }
    }
    
    func rightButtonPressed() {
        viewController?.dismiss(animated: true) {
            
        }
    }
}

enum CoefficientType {
    case clear(model: NoСoefficientModel)
    case value(model: ValueСoefficientModel)
    case choice(model: ChoiceCoefficientModel)
    case defaultValue(model: DefaultCoefficientValueModel, value: Double)
}
