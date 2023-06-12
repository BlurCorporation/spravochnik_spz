//
//  CalculationPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

protocol CalculationPresenterProtocol: AnyObject {
    func viewDidLoad()
    func checkBoxCellPressed(index: Int)
    func calculationButtonPressed()
    func otherCalculationButtonPressed()
}

// MARK: - CalculationPresenter

final class CalculationPresenter {
    weak var viewController: CalculationViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let title: String
    private let calculationType: СalculationType
    private let defaulValueCoefficients: [DefaultCoefficientValueModel]
    private let valueCoefficients: [ValueСoefficientModel]
    private let choiceCoefficients: [ChoiceCoefficientModel]
    private var checkboxCoefficients: [CheckboxСoefficientModel]
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         calculationType: СalculationType) {
        self.sceneBuildManager = sceneBuildManager
        self.calculationType = calculationType
        title = calculationType.title
        defaulValueCoefficients = calculationType.defaultValueCoefficients
        valueCoefficients = calculationType.valueCoefficients
        choiceCoefficients = calculationType.choiceCoefficients
        checkboxCoefficients = calculationType.checkboxCoefficients
    }
    
    private func makeValueCoefSection() -> CalculationViewController.Section {
        let rows = valueCoefficients.map { model -> CalculationViewController.RowType in
            let viewModel = ValueСoefficientViewModel(title: model.type.title,
                                                      value: model.value,
                                                      descrpt: model.type.descrp,
                                                      type: model.type,
                                                      delegate: self)
            return CalculationViewController.RowType.valueСoefficient(viewModel: viewModel)
        }
        return CalculationViewController.Section(type: .valueСoefficients,
                       rows: rows)
    }
    
    private func makeDefaultValueCoefSection() -> CalculationViewController.Section {
        let rows = defaulValueCoefficients.map { model -> CalculationViewController.RowType in
            let viewModel = DefaultCoefficientValueViewModel(
                title: model.type.title,
                value: model.type.defaultValue,
                delegate: self
            )
            return CalculationViewController.RowType.defaultvalueСoefficients(viewModel: viewModel)
        }
        return CalculationViewController.Section(type: .defaultvalueСoefficients,
                       rows: rows)
    }
    
    private func makeCheckBoxSection() -> CalculationViewController.Section {
        let rows = checkboxCoefficients.map { model -> CalculationViewController.RowType in
            let viewModel = CheckboxСoefficientViewModel(title: model.type.title,
                                                         isSelected: model.isSelected)
            return CalculationViewController.RowType.checkboxСoefficient(viewModel: viewModel)
        }
        return CalculationViewController.Section(type: .checkboxСoefficient,
                       rows: rows)
    }
    
    private func makeChoiceCoefSection() -> CalculationViewController.Section {
        let rows = choiceCoefficients.map { model -> CalculationViewController.RowType in
            let viewModel = ChoiceCoefficientViewModel(title: model.type.title,
                                                       descrpt: model.type.descrp,
                                                       type: model.type,
                                                       delegate: self)
            return CalculationViewController.RowType.choiceСoefficient(viewModel: viewModel)
        }
        return CalculationViewController.Section(type: .choiceСoefficients,
                       rows: rows)
    }
    
    private func makeSections() {
        let sections: [CalculationViewController.Section] = [
            makeValueCoefSection(),
            makeChoiceCoefSection(),
            makeDefaultValueCoefSection(),
            makeCheckBoxSection()
        ]
        
        viewController?.updateHeader(viewModel: .init(title: title,
                                                      delegate: self))
        viewController?.update(sections: sections)
    }
}

//MARK: - CalculationPresenterExtension

extension CalculationPresenter: CalculationPresenterProtocol {
    func viewDidLoad() {
        makeSections()
        CalculationHeaderViewCell().delegate = self
    }
    
    func checkBoxCellPressed(index: Int) {
        checkboxCoefficients[index].isSelected.toggle()
        makeSections()
    }
    
    func calculationButtonPressed() {
        let resultViewController = sceneBuildManager.buildResultScreen(
            navigationBarTitle: title,
            calculationType: calculationType,
            defaulValueCoefficients: defaulValueCoefficients,
            valueCoefficients: valueCoefficients,
            choiceCoefficients: choiceCoefficients,
            checkboxCoefficients: checkboxCoefficients)
        viewController?.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    func otherCalculationButtonPressed() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
}

extension CalculationPresenter: CalculationHeaderViewCellCellDelegate {
    func quitButtonPressed() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}

extension CalculationPresenter: ValueCoefficientTableViewCellDelegate {
    func valueCoefficientCellPressed(value: Double,
                                     type: ValueСoefficientType) {
        let model = ValueСoefficientModel(type: type,
                                          value: value)
        let vc = sceneBuildManager.buildAlertScreen(coefficientType: .value(model: model))
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true)
    }
}

extension CalculationPresenter: ChoiceCoefficientTypeTableViewCellDelegate {
    func choiceCoefficientCellPressed(value: Double, coefType: ChoiceСoefficientType) {
        let model = ChoiceCoefficientModel(type: coefType, itemIndex: 0)
        let vc = sceneBuildManager.buildAlertScreen(coefficientType: .choice(model: model))
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true)
    }
}

extension CalculationPresenter: DefaultValueCoefficientTableViewCellDelegate {
    func defaultValueCoefficientCellPressed(value: Double) {
        let model = DefaultCoefficientValueModel(type: .inflationRate)
        let vc = sceneBuildManager.buildAlertScreen(coefficientType: .defaultValue(model: model,
                                                                                   value: value))
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true)
    }
}
