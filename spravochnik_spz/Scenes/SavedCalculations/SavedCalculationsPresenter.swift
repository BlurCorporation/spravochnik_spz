//
//  SavedCalculationsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - SavedCalculationsPresenterProtocol

protocol SavedCalculationsTablePresenterProtocol: AnyObject {
    func viewDidLoad()
    func openCell(text: String)
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
                                                        calculationResult: [CalculationResultModel(title: "CalculationResultTitle",
                                                                                                   value: 5.5,
                                                                                                   prices: [PriceModel(type: PriceModelType(title: "PriceModelTypeTitle",
                                                                                                                                            value: 6.6))])])]
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
                                                    actionHandler: {}))

            
            
             })
        return cells
    }
    
    func openCell(text: String) {
        switch text {
//        case "Пожарная сигнализация":
//            let nextViewController = sceneBuildManager.buildFireAlarmSystemResultsScreen()
//            viewController?.navigationController?.pushViewController(nextViewController,
//                                                                     animated: true)
//        case "Охранная сигнализация":
//            let nextViewController = sceneBuildManager.buildSecurityAlarmSystemResultsScreen()
//            viewController?.navigationController?.pushViewController(nextViewController,
//                                                                     animated: true)
//        case "Насосные станции установок пожаротушения":
//            let nextViewController = sceneBuildManager.buildFirePumpStationResultsScreen()
//            viewController?.navigationController?.pushViewController(nextViewController,
//                                                                     animated: true)
//        case "Система оповещения о пожаре":
//            let nextViewController = sceneBuildManager.buildNotificationSystemResultsScreen()
//            viewController?.navigationController?.pushViewController(nextViewController,
//                                                                     animated: true)
//        case "Охранная сигнализация периметра":
//            let nextViewController = sceneBuildManager.buildPerimeterAlarmSystemResultsScreen()
//            viewController?.navigationController?.pushViewController(nextViewController,
//                                                                     animated: true)
//        case "Система управления дымоудаления":
//            let nextViewController = sceneBuildManager.buildSmokeExhaustSystemResultsScreen()
//            viewController?.navigationController?.pushViewController(nextViewController,
//                                                                     animated: true)
//        case "Модульные установки пожаротушения":
//            let nextViewController = sceneBuildManager.buildModuleFirefightingSystemResultsScreen()
//            viewController?.navigationController?.pushViewController(nextViewController,
//                                                                     animated: true)
        default:
            let nextViewController = sceneBuildManager.buildTabBarScreen()
            viewController?.navigationController?.pushViewController(nextViewController,
                                                                     animated: true)
        }
    }
}
