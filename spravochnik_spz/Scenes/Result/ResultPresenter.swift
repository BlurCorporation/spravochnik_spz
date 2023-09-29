//
//  ResultPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import Foundation
import PDFKit
import UIKit

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
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let resultType: ResultType
    private let calculationService: CalculationServicable
    private let firestore: FirebaseServiceProtocol
    private let pdfService: PDFServiceProtocol
    private let calculationType: СalculationType
    private let defaulValueCoefficients: [DefaultCoefficientValueModel]
    private let valueCoefficients: [ValueСoefficientModel]
    private let choiceCoefficients: [ChoiceCoefficientModel]
    private let checkboxCoefficients: [CheckboxСoefficientModel]
    private var calculationResult: [CalculationResultModel] = []
    private let format: DateFormatter
    private let navigationItemTitle: String
    private var address: String? = nil
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         resultType: ResultType,
         calculationService: CalculationServicable,
         firestore: FirebaseServiceProtocol,
         pdfService: PDFServiceProtocol,
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
        self.pdfService = pdfService
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
            let value = model.type.items[model.itemIndex ?? 0]
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
    
    private func makeRequestData() -> [Calculation] {
        format.dateFormat = "dd.MM.yyyy"
        let date = format.string(from: Date())
        var price: Double = 0
        
        calculationResult.map { model in
            price += model.prices.first?.value ?? 0.0
        }
        
        var stages: String = ""
        if calculationResult.count == 2 {
            stages = "1-стадийная разработка"
        } else {
            stages = "2-хстадийная разработка"
        }
        
        let data: [Calculation] = [Calculation(address: address ?? "",
                                               date: date,
                                               stages: stages,
                                               cost: price,
                                               navigationBarTitle: navigationItemTitle,
                                               calculationType: calculationType,
                                               valueCoef: valueCoefficients,
                                               choiceCoef: choiceCoefficients,
                                               defaultCoef: defaulValueCoefficients,
                                               checkboxСoef: checkboxCoefficients,
                                               calculationResult: calculationResult)]
        return data
    }
    
    private func setCalcToFB() {
        let fbService: FirebaseServiceProtocol = FirebaseService()
        let calculation = makeRequestData()
        let uuid = UUID().uuidString
        let calcModel = CalculationModel(userID: firestore.getUserID(), calcName: uuid, calculation: calculation)
        FirebaseRepository(firebaseService: fbService).setCalculation(calcModel: calcModel) { result in
            switch result {
            case .success(let calc):
                print("MODEL SET: ", calc)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func routeToAlert(coefficientType: CoefficientType) {
        let handler = { [weak self] in
            self?.setCalcToFB()
            self?.viewController?.navigationController?.popToRootViewController(animated: true)
        }
        let vc = sceneBuildManager.buildAlertScreen(coefficientType: coefficientType, index: 0, delegate: self, handler: handler)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true)
    }
    
    private func savePDFToTemporaryDirectory(pdfDocument: PDFDocument?) -> URL? {
        guard let pdfDocument = pdfDocument else { return nil }

        do {
            let tempDirectory = FileManager.default.temporaryDirectory
            let pdfURL = tempDirectory.appendingPathComponent("shared.pdf")

            try pdfDocument.write(to: pdfURL)
            return pdfURL
        } catch {
            print("Error saving PDF: \(error.localizedDescription)")
            return nil
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
        let model = ValueСoefficientModel(type: .address,
                                          value: 0)
        let coefficientsType = CoefficientType.value(model: model)
        routeToAlert(coefficientType: coefficientsType)
//        setCalcToFB()
//        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    func shareButtonButtonPressed() {
        guard let pdfURL = pdfService.generatePDF(from: "123") else {
            // Handle the case where saving the PDF to a temporary directory failed
            return
        }

        let activityViewController = UIActivityViewController(activityItems: [pdfURL], applicationActivities: nil)

        // Present the activity view controller
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
    
    func otherCalculationButtonPressed() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupNavigetionItemTitle() {
        viewController?.setupNavigationItem(title: navigationItemTitle)
    }
}

extension ResultPresenter: AlertPresenterDelegate {
    func saveButtonPressed(type: CoefficientType, index: Int) {
        switch type {
        case .clear(_):
            break
        case .value(model: let model):
            self.address = model.stringValue
        case .choice(_):
            break
        case .defaultValue(_):
            break
        }
    }
}
