//
//  ResultPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import Foundation

// MARK: -  ResultPresenterProtocol

protocol  ResultPresenterProtocol: AnyObject {
    func viewDidLoad()
    func backButtonPressed()
    func calculationButtonPressed()
    func shareButtonButtonPressed()
    func otherCalculationButtonPressed()
    func setupNavigetionItemTitle()
}

// MARK: -  ResultPresenter

final class  ResultPresenter {
    weak var viewController:  ResultViewProtocol?
    private let navigationItemTitle: String
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let resultType: ResultType
    private let calculationService: CalculationServicable
    private let firestore: FirebaseServiceProtocol
    private let calculationType: СalculationType
    private let defaulValueCoefficients: [DefaultCoefficientValueModel]
    private let valueCoefficients: [ValueСoefficientModel]
    private let choiceCoefficients: [ChoiceCoefficientModel]
    private let checkboxCoefficients: [CheckboxСoefficientModel]
    private var calculationResult: [CalculationResultModel] = []
    private let format: DateFormatter
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         resultType: ResultType,
         calculationService: CalculationServicable,
         firestore: FirebaseServiceProtocol,
         calculationType: СalculationType,
         navigationBarTitle: String,
         defaulValueCoefficients: [DefaultCoefficientValueModel],
         valueCoefficients: [ValueСoefficientModel],
         choiceCoefficients: [ChoiceCoefficientModel],
         checkboxCoefficients: [CheckboxСoefficientModel],
         format: DateFormatter) {
        self.sceneBuildManager = sceneBuildManager
        self.resultType = resultType
        self.calculationService = calculationService
        self.firestore = firestore
        self.calculationType = calculationType
        self.navigationItemTitle = navigationBarTitle
        self.defaulValueCoefficients = defaulValueCoefficients
        self.valueCoefficients = valueCoefficients
        self.choiceCoefficients = choiceCoefficients
        self.checkboxCoefficients = checkboxCoefficients
        self.format = format
    }
    
    private func makeValueCoefResultSection() -> ResultViewController.Section {
        let rows = valueCoefficients.map { model -> ResultViewController.RowType in
            let viewModel = ValueСoefficientResultViewModel(title: "\(model.type.title) \(model.value) \(model.type.descrp)")
            return ResultViewController.RowType.valueСoefficient(viewModel: viewModel)
        }
        return ResultViewController.Section(type: .valueСoefficients,
                       rows: rows)
    }
    
    private func makeChoiceСoefficientResultSection() -> ResultViewController.Section {
        let rows = choiceCoefficients.map { model -> ResultViewController.RowType in
            // подставить, когда будут заполнены все сущности
            let value = 2//model.type.items[model.itemIndex].value
            let viewModel = ChoiceCoefficientResultViewModel(title: "\(model.type.title) \(value) \(model.type.descrp)")
            return ResultViewController.RowType.choiceСoefficient(viewModel: viewModel)
        }
        return ResultViewController.Section(type: .choiceСoefficients,
                       rows: rows)
    }
    
    private func makeDefaultCoefficientValueResultSection() -> ResultViewController.Section {
        let rows = defaulValueCoefficients.map { model -> ResultViewController.RowType in
            let viewModel = DefaultCoefficientValueResultViewModel(title: "\(model.type.title) \(model.value ?? model.type.defaultValue)")
            return ResultViewController.RowType.defaultvalueСoefficients(viewModel: viewModel)
        }
        return ResultViewController.Section(type: .defaultvalueСoefficients,
                       rows: rows)
    }
    
    private func makeCheckBoxCoefficientValueResultSection() -> ResultViewController.Section {
        let checkboxCoefficients = self.checkboxCoefficients.filter {
            $0.isSelected
        }
        let rows = checkboxCoefficients.map { model -> ResultViewController.RowType in
            let viewModel = CheckboxСoefficientResultViewModel(title: model.type.title)
            return ResultViewController.RowType.checkboxСoefficient(viewModel: viewModel)
        }
        return ResultViewController.Section(type: .checkboxСoefficient,
                       rows: rows)
    }
    
    private func makeCalculationResultSection() -> ResultViewController.Section {
        calculationResult = calculationService.calculate(
            type: calculationType,
            defaulValueCoefficients: defaulValueCoefficients,
            valueCoefficients: valueCoefficients,
            choiceCoefficients: choiceCoefficients,
            checkboxCoefficients: checkboxCoefficients
        )
        let rows = calculationResult.map { model -> ResultViewController.RowType in
            let prices = model.prices.map { model -> PriceViewModel in
                PriceViewModel(
                    title: model.type.title,
                    description: "\(model.type.carrency)",
                    cost: String(format: "%.2f", Double(model.value))
                )
            }
            let viewModel = CalculationResultViewModel(title: model.title.title, description: model.description, prices: prices)
            return ResultViewController.RowType.calculationResult(viewModel: viewModel)
        }
        return ResultViewController.Section(type: .checkboxСoefficient,
                       rows: rows)
    }
    
    private func setCalcToFB() {
        let fbService: FirebaseServiceProtocol = FirebaseService()
        format.dateFormat = "dd.MM.yyyy"
        let date = format.string(from: Date())
        var price: Double = 0
        
        calculationResult.map { model in
            price += model.prices.first?.value ?? 0.0
        }
        
        let data: [Calculation] = [Calculation(address: "",
                                               date: date,
                                               stages: "",
                                               cost: price,
                                               navigationBarTitle: "",
                                               calculationType: calculationType,
                                               valueCoef: valueCoefficients,
                                               choiceCoef: choiceCoefficients,
                                               defaultCoef: defaulValueCoefficients,
                                               checkboxСoef: checkboxCoefficients,
                                               calculationResult: calculationResult)]
        let calcModel = CalculationModel(userID: firestore.getUserID(), calcName: "Correct Coefs", calculation: data)
        FirebaseRepository(firebaseService: fbService).setCalculation(calcModel: calcModel) { result in
            switch result {
            case .success(let calc):
                print("MODEL SET: ", calc)
            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: -  ResultPresenterExtension

extension  ResultPresenter:  ResultPresenterProtocol {
    func viewDidLoad() {
        let sections = [makeValueCoefResultSection(),
                        makeChoiceСoefficientResultSection(),
                        makeDefaultCoefficientValueResultSection(),
                        makeCheckBoxCoefficientValueResultSection(),
                        makeCalculationResultSection()]
        viewController?.update(sections: sections)
        switch resultType {
        case .close:
            viewController?.hideButtonsForCloseType()
            viewController?.resultType = .close
        case .save: break
        }
    }
    
    func backButtonPressed() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func calculationButtonPressed() {
        setCalcToFB()
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    func shareButtonButtonPressed() {
        print(#function)
    }
    
    func otherCalculationButtonPressed() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupNavigetionItemTitle() {
        viewController?.setupNavigationItem(title: navigationItemTitle)
    }
}
