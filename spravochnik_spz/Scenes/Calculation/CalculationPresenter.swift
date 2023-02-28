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
}

// MARK: - CalculationPresenter

final class CalculationPresenter {
    weak var viewController: CalculationViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let title: String
    private let valueCoefficients: [ValueСoefficientModel]
    private let choiceCoefficients: [ChoiceCoefficientModel]
    private var checkboxCoefficients: [CheckboxСoefficientModel]
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         calculationType: СalculationType) {
        self.sceneBuildManager = sceneBuildManager
        title = calculationType.title
        valueCoefficients = calculationType.valueCoefficients
        choiceCoefficients = calculationType.choiceCoefficients
        checkboxCoefficients = calculationType.checkboxCoefficients
    }
    
    private func makeValueCoefSection() -> Section {
        let rows = valueCoefficients.map { model -> RowType in
            let viewModel = ValueСoefficientViewModel(
                title: model.type.title,
                value: model.value,
                descrpt: model.type.descrp
            )
            return RowType.valueСoefficient(viewModel: viewModel)
        }
        return Section(type: .valueСoefficients, rows: rows)
    }
    
    private func makeCheckBoxSection() -> Section {
        let rows = checkboxCoefficients.map { model -> RowType in
            let viewModel = CheckboxСoefficientViewModel(title: model.type.title, isSelected: model.isSelected)
            return RowType.checkboxСoefficient(viewModel: viewModel)
        }
        return Section(type: .checkboxСoefficient, rows: rows)
    }
    
    private func makeChoiceCoefSection() -> Section {
        let rows = choiceCoefficients.map { model -> RowType in
            let viewModel = ChoiceCoefficientViewModel(title: model.type.title)
            return RowType.choiceСoefficient(viewModel: viewModel)
        }
        return Section(type: .choiceСoefficients, rows: rows)
    }
    
    private func makeSections() {
        let sections: [Section] = [
            makeValueCoefSection(),
            makeChoiceCoefSection(),
            makeCheckBoxSection()
            
        ]
        
        viewController?.updateHeader(viewModel: .init(title: title))
        viewController?.update(sections: sections)
    }
}

//MARK: - CalculationPresenterExtension

extension CalculationPresenter: CalculationPresenterProtocol {
    func viewDidLoad() {
        makeSections()
    }
    
    func checkBoxCellPressed(index: Int) {
        
        checkboxCoefficients[index].isSelected.toggle()
        makeSections()
    }
}
