//
//  AlertPresenter.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 23.03.2023.
//


// MARK: - AlertPresenterProtocol

protocol AlertPresenterDelegate: AnyObject {
    func saveButtonPressed(type: CoefficientType, index: Int)
}

protocol AlertPresenterProtocol: AnyObject {
    func viewDidLoad()
    func rightButtonPressed()
    func leftButtonPressed()
    func method(type: CoefficientType, value: String?)
    func changeRightHandler(handler: (() -> Void)?)
}

// MARK: - ALertPresenter

final class AlertPresenter {
    weak var viewController: AlertViewProtocol?
    weak var delegate: AlertPresenterDelegate?
    
    // MARK: PrivateProperties
    private var rightButtonHandler: (() -> Void)?
    private let coefficientType: CoefficientType
    private let index: Int
    // MARK: - Initializer
    
    init(coefficientType: CoefficientType, index: Int) {
        self.coefficientType = coefficientType
        self.index = index
    }
}

// MARK: - AlertPresenterExtension

extension AlertPresenter: AlertPresenterProtocol {
    func viewDidLoad() {
        viewController?.changeKeyboard(type: coefficientType)
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
            viewController?.changeCurrectSelected(index: model.itemIndex)
            let axis = model.type
            let title = model.type.title
            let collectionViewDataSource = [String]()
            self.viewController?.update(dataSource: self.makeData(axis))
            viewController?.updateUIForChoice(title: title,
                                              axis: axis,
                                              numOfItems: 0)
        case let .defaultValue(model):
            let title = model.type.title
            let value = model.value ?? model.type.defaultValue
            viewController?.updateUIForValue(title: title, value: value)
        }
        viewController?.method(type: coefficientType)
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
    
    func method(type: CoefficientType, value: String?) {
        switch type {
        case .clear(let model):
//            let coefficientType = CoefficientType.clear(model: model)
//            delegate?.saveButtonPressed(type: coefficientType, index: 0)
//            viewController?.dismiss(animated: true)
            rightButtonPressed()
        case .value(let model):
            let newValue = Double(value ?? "") ?? 0.0
            let newModel = ValueСoefficientModel(type: model.type, value: newValue, stringValue: value) //TODO: переделать внесение stringValue
            let coefficientType = CoefficientType.value(model: newModel)
            delegate?.saveButtonPressed(type: coefficientType, index: index)
            (rightButtonHandler ?? {})()
            viewController?.dismiss(animated: true)
        case .choice(let model):
            let newModel = ChoiceCoefficientModel(type: model.type, itemIndex: viewController?.currentSelected)
            let coefficientType = CoefficientType.choice(model: newModel)
            viewController?.dismiss(animated: true)
            delegate?.saveButtonPressed(type: coefficientType, index: index)
        case .defaultValue(let model):
            let newValue = Double(value ?? "") ?? 0.0
            let newModel = DefaultCoefficientValueModel(type: model.type, value: newValue)
            let coefficientType = CoefficientType.defaultValue(model: newModel)
            viewController?.dismiss(animated: true)
            delegate?.saveButtonPressed(type: coefficientType, index: index)
        }
    
        //saveButtonHandler?(coefficientType)
    }
    
    func changeRightHandler(handler: (() -> Void)?) {
        rightButtonHandler = handler
    }
}

enum CoefficientType {
    case clear(model: NoСoefficientModel)
    case value(model: ValueСoefficientModel)
    case choice(model: ChoiceCoefficientModel)
    case defaultValue(model: DefaultCoefficientValueModel)
}
