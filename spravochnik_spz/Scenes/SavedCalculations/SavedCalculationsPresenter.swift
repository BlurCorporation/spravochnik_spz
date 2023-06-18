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
    
    
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
        testSetGetCalcFromFB()
    }
    
    // Тест работы с ФБ через репозиторий, удалить после
    private func testSetGetCalcFromFB() {
        let fbService: FirebaseServiceProtocol = FirebaseService()
        let testCalcModel: [Calculation] = [Calculation(valueCoef: [ValueСoefficientResultModel(title: "ValueСoefTitle",
                                                                                                description: "ValueСoefDesc",
                                                                                                value: 1.1),
                                                                    ValueСoefficientResultModel(title: "ValueСoefTitle2",
                                                                                                description: "ValueСoefDesc2",
                                                                                                value: 1.2)],
                                                        choiceCoef: [ChoiceCoefficientResultModel(title: "ChoiceCoefTitle",
                                                                                                  description: "ChoiceCoefDesc",
                                                                                                  value: 2.2)],
                                                        defaultCoef: [DefaultCoefficientValueResultModel(title: "DefaultCoefTitle",
                                                                                                         value: 3.3),
                                                                      DefaultCoefficientValueResultModel(title: "DefaultCoefTitle2",
                                                                                                         value: 3.4)],
                                                        checkboxСoef: [CheckboxСoefficientResultModel(title: "CheckboxСoefTitle",
                                                                                                      value: 4.4)],
                                                        calculationResult: [CalculationResultModel(title: TitleType.stageP,
                                                                                                   description: "",
                                                                                                   prices: [PriceModel(type: PriceType.withVat,
                                                                                                                       value: 0.5)])])]
//        let calcModel = CalculationModel(userID: "UserID 222", calcName: "Test Calc3", calculation: testCalcModel)
//        FirebaseRepository(firebaseService: fbService).setCalculation(calcModel: calcModel) { result in
//            switch result {
//            case .success(let calc):
//                print("MODEL GET: ", calc)
//            case .failure(let error):
//                print(error)
//            }
//        }
        FirebaseRepository(firebaseService: fbService).getAllCalculations(userID: "UserID 222") { result in
            switch result {
            case .success(let calc):
                print("MODEL GET: ", calc)
            case .failure(let error):
                print(error)
            }
        }
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
                let securityAlarmViewController = self.sceneBuildManager.buildCalculationScreen(calculationType: result.type)
                self.viewController?.navigationController?.pushViewController(securityAlarmViewController,
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
