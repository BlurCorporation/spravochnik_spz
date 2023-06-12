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
    func leftButtonPressed()
}

// MARK: - ALertPresenter

final class AlertPresenter {
    weak var viewController: AlertViewProtocol?
    
    // MARK: PrivateProperties
    private var rightButtonHandler: (() -> Void)?
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
        case let .clear(model):
            let title = model.title
            let leftButtonTitle = model.leftButton
            let rightButtonTittle = model.rightButton
            rightButtonHandler = model.rightButtonHandler
            viewController?.updateUIForClear(title: title,
                                             leftButtonTitle: leftButtonTitle,
                                             rightButtonTitle: rightButtonTittle)
        case let .value(model):
            let title = model.type.title
            viewController?.updateUIForValue(title: title,
                                             value: model.value)
        case let .choice(model):
            let axis = model.type
            let title = model.type.title
            let collectionViewDataSource = [String]()
            self.viewController?.update(dataSource: self.makeData(axis))
            viewController?.updateUIForChoice(title: title,
                                              axis: axis,
                                              numOfItems: 0)
        case let .defaultValue(model, value):
            let title = model.type.title
            viewController?.updateUIForValue(title: title, value: value)
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
    
    func leftButtonPressed() {
        viewController?.dismiss(animated: true) { }
    }
    
    func rightButtonPressed() {
        viewController?.dismiss(animated: true) { [self] in
            guard let handler = rightButtonHandler else { return }
            handler()
        }
    }
}

enum CoefficientType {
    case clear(model: NoСoefficientModel)
    case value(model: ValueСoefficientModel)
    case choice(model: ChoiceCoefficientModel)
    case defaultValue(model: DefaultCoefficientValueModel, value: Double)
}
