//
//  SavedCalculationsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - SavedCalculationsPresenterProtocol

protocol SavedCalculationsTablePresenterProtocol: AnyObject {
    func viewDidLoad()
    func openCell(actionHandler: () -> Void)
}

// MARK: - SavedCalculationsPresenter

final class SavedCalculationsTablePresenter {
    weak var viewController: SavedCalculationsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private var data: Calculation = Calculation(navigationBarTitle: "",
                                                calculationType: .fireAlarmSystem,
                                                valueCoef: [ValueСoefficientModel(type: .lengthOfThePerimeter, value: 20)],
                                                 choiceCoef: [ChoiceCoefficientModel(type: .numberOfFirePumpGroups, itemIndex: 3)],
                                                 defaultCoef: [DefaultCoefficientValueModel(type: .inflationRate)],
                                                 checkboxСoef: [CheckboxСoefficientModel(type: .availabilityOfAlertsForIndividualEvacuationZones, isSelected: true)],
                                                calculationResult: [CalculationResultModel(title: TitleType.stageP,                                                                       description: "",
                                                                                           prices: [PriceModel(type: PriceType.withVat,
                                                                                                               value: 0.5)])])
    
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
        testSetGetCalcFromFB()
    }
    
    // Тест работы с ФБ через репозиторий, удалить после
    private func testSetGetCalcFromFB() {
        let fbService: FirebaseServiceProtocol = FirebaseService()
        let testCalcModel: [Calculation] = [Calculation(navigationBarTitle: "111",
                                                        calculationType: .fireAlarmSystem,
                                                        valueCoef: [ValueСoefficientModel(type: .lengthOfThePerimeter, value: 20)],
                                                        choiceCoef: [ChoiceCoefficientModel(type: .numberOfFirePumpGroups, itemIndex: 3)],
                                                        defaultCoef: [DefaultCoefficientValueModel(type: .inflationRate)],
                                                        checkboxСoef: [CheckboxСoefficientModel(type: .availabilityOfAlertsForIndividualEvacuationZones, isSelected: true)],
                                                        calculationResult: [CalculationResultModel(title: TitleType.stageP,                                                                       description: "",
                                                                                                   prices: [PriceModel(type: PriceType.withVat,
                                                                                                                       value: 0.5)])])]
        
        let calcModel = CalculationModel(userID: "UserID 1", calcName: "Correct Coefs2", calculation: testCalcModel)
        FirebaseRepository(firebaseService: fbService).setCalculation(calcModel: calcModel) { result in
            switch result {
            case .success(let calc):
                print("MODEL GET: ", calc)
            case .failure(let error):
                print(error)
            }
        }

        FirebaseRepository(firebaseService: fbService).getCalculation(userID: "UserID 1", calcName: "Correct Coefs2") { result in
            switch result {
            case .success(let calc):
                self.data = calc
                print("MODEL GET: ", calc)
            case .failure(let error):
                print(error)
            }
        }
        
//        FirebaseRepository(firebaseService: fbService).getAllCalculations(userID: "UserID 222") { result in
//            switch result {
//            case .success(let calc):
//                print("MODEL GET: ", calc)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}

//MARK: - SavedCalculationsPresenterExtension

extension SavedCalculationsTablePresenter: SavedCalculationsTablePresenterProtocol {
    func viewDidLoad() {
        self.viewController?.update(dataSource: self.makeData())
    }
    
    
    private func makeData()-> [SavedCalculationsCellModelProtocol] {
        var cells: [SavedCalculationsCellModelProtocol] = [SavedCalculationsCellModel]()
        SavedCalculationsCellModel.calculations.compactMap({ result in
            cells.append(SavedCalculationsCellModel(address: result.address,
                                                    system: result.system,
                                                    date: result.date,
                                                    stages: result.stages,
                                                    cost: result.cost,
                                                    image: result.image,
                                                    backgroundImage: result.backgroundImage,
                                                    actionHandler: {
//                let vc = self.sceneBuildManager.buildCalculationScreen(calculationType: result.type)
                let vc = self.sceneBuildManager.buildResultScreen(navigationBarTitle: self.data.navigationBarTitle, calculationType: self.data.calculationType, defaulValueCoefficients: self.data.defaultCoef, valueCoefficients: self.data.valueCoef, choiceCoefficients: self.data.choiceCoef, checkboxCoefficients: self.data.checkboxСoef)
                self.viewController?.navigationController?.pushViewController(vc,
                                                                              animated: true)
            },
                                                    type: result.type)
            )
            
        })
        return cells
    }
    
    func openCell(actionHandler: () -> Void) {
        actionHandler()
    }
}
