//
//  CalculationPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//


// MARK: - CalculationPresenterProtocol

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
    private let defaulValueCoefficients: [DefaultCoefficientValueModel]
    private let valueCoefficients: [ValueСoefficientModel]
    private let choiceCoefficients: [ChoiceCoefficientModel]
    private var checkboxCoefficients: [CheckboxСoefficientModel]
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         calculationType: СalculationType) {
        self.sceneBuildManager = sceneBuildManager
        title = calculationType.title
        defaulValueCoefficients = calculationType.defaultValueCoefficients
        valueCoefficients = calculationType.valueCoefficients
        choiceCoefficients = calculationType.choiceCoefficients
        checkboxCoefficients = calculationType.checkboxCoefficients
    }
    
    private func makeValueCoefSection() -> Section {
        let rows = valueCoefficients.map { model -> RowType in
            let viewModel = ValueСoefficientViewModel(title: model.type.title,
                                                      value: model.value,
                                                      descrpt: model.type.descrp,
                                                      delegate: self)
            return RowType.valueСoefficient(viewModel: viewModel)
        }
        return Section(type: .valueСoefficients,
                       rows: rows)
    }
    
    private func makeDefaultValueCoefSection() -> Section {
        let rows = defaulValueCoefficients.map { model -> RowType in
            let viewModel = DefaultCoefficientValueViewModel(
                title: model.type.title,
                value: model.type.defaultValue,
                delegate: self
            )
            return RowType.defaultvalueСoefficients(viewModel: viewModel)
        }
        return Section(type: .defaultvalueСoefficients,
                       rows: rows)
    }
    
    private func makeCheckBoxSection() -> Section {
        let rows = checkboxCoefficients.map { model -> RowType in
            let viewModel = CheckboxСoefficientViewModel(title: model.type.title,
                                                         isSelected: model.isSelected)
            return RowType.checkboxСoefficient(viewModel: viewModel)
        }
        return Section(type: .checkboxСoefficient,
                       rows: rows)
    }
    
    private func makeChoiceCoefSection() -> Section {
        let rows = choiceCoefficients.map { model -> RowType in
            let viewModel = ChoiceCoefficientViewModel(title: model.type.title,
                                                       descrpt: model.type.descrp,
                                                       delegate: self)
            return RowType.choiceСoefficient(viewModel: viewModel)
        }
        return Section(type: .choiceСoefficients,
                       rows: rows)
    }
    
    private func makeSections() {
        let sections: [Section] = [
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
        print(#function)
    }
    
    func otherCalculationButtonPressed() {
        print(#function)
    }
}

extension CalculationPresenter: CalculationHeaderViewCellCellDelegate {
    func quitButtonPressed() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}

extension CalculationPresenter: ValueCoefficientTableViewCellDelegate {
    func valueCoefficientCellPressed(value: Double) {
        print("ValueCoefficientTableViewCellDelegate из презентора")
    }
}

extension CalculationPresenter: ChoiceCoefficientTypeTableViewCellDelegate {
    func choiceCoefficientCellPressed(value: Double) {
        print("ChoiceCoefficientTypeTableViewCellDelegate из презентора")
    }
}

extension CalculationPresenter: DefaultValueCoefficientTableViewCellDelegate {
    func defaultValueCoefficientCellPressed(value: Double) {
        print("DefaultValueCoefficientTableViewCellDelegate из презентора")
    }
}
