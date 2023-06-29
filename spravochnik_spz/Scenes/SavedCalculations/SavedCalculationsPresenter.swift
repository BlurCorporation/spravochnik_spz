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
    private var data: [Calculation] = [Calculation(address: "",
                                                   date: "",
                                                   stages: "",
                                                   cost: 0,
                                                   navigationBarTitle: "",
                                                   calculationType: .fireAlarmSystem,
                                                   valueCoef: [ValueСoefficientModel(type: .lengthOfThePerimeter, value: 20)],
                                                   choiceCoef: [ChoiceCoefficientModel(type: .numberOfFirePumpGroups, itemIndex: 3)],
                                                   defaultCoef: [DefaultCoefficientValueModel(type: .inflationRate)],
                                                   checkboxСoef: [CheckboxСoefficientModel(type: .availabilityOfAlertsForIndividualEvacuationZones,                                               isSelected: true)],
                                                   calculationResult: [CalculationResultModel(title: TitleType.stageP,                                                                               description: "",
                                                                                              prices: [PriceModel(type: PriceType.withVat,
                                                                                                                  value: 0.5)])])]
    
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
        testSetGetCalcFromFB()
    }
    
    // Тест работы с ФБ через репозиторий, удалить после
    private func testSetGetCalcFromFB() {
        let fbService: FirebaseServiceProtocol = FirebaseService()
        let testCalcModel: [Calculation] = [Calculation(address: "Москва",
                                                        date: "01.01.2022",
                                                        stages: "2-х стадийный",
                                                        cost: 89_006.53,
                                                        navigationBarTitle: "111",
                                                        calculationType: .fireAlarmSystem,
                                                        valueCoef: [ValueСoefficientModel(type: .lengthOfThePerimeter, value: 20)],
                                                        choiceCoef: [ChoiceCoefficientModel(type: .numberOfFirePumpGroups, itemIndex: 3)],
                                                        defaultCoef: [DefaultCoefficientValueModel(type: .inflationRate)],
                                                        checkboxСoef: [CheckboxСoefficientModel(type: .availabilityOfAlertsForIndividualEvacuationZones,                                       isSelected: true)],
                                                        calculationResult: [CalculationResultModel(title: TitleType.stageP,                                                                       description: "",
                                                                                                   prices: [PriceModel(type: PriceType.withVat,
                                                                                                                       value: 0.5)])])]
        
        let calcModel = CalculationModel(userID: "UserID", calcName: "Correct Coefs4", calculation: testCalcModel)
        FirebaseRepository(firebaseService: fbService).setCalculation(calcModel: calcModel) { result in
            switch result {
            case .success(let calc):
                print("MODEL SET: ", calc)
            case .failure(let error):
                print(error)
            }
        }

//        FirebaseRepository(firebaseService: fbService).getCalculation(userID: "UserID 1", calcName: "Correct Coefs2") { result in
//            switch result {
//            case .success(let calc):
//                self.data = calc
//                print("MODEL GET: ", calc)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        FirebaseRepository(firebaseService: fbService).getAllCalculations(userID: "UserID") { result in
            switch result {
            case .success(let calc):
                guard let calc = calc else { return }
                self.data = calc
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
        print(data)
        let result: [SavedCalculationsCellModelProtocol] = self.data.compactMap { item in
            return SavedCalculationsCellModel(address: item.address,
                                              system: item.calculationType.title,
                                              date: item.date,
                                              stages: item.stages,
                                              cost: item.cost,
                                              image: Constants.Images.perimetrAlarmIcon,
                                              backgroundImage: Constants.Images.grayBackground,
                                              type: item.calculationType,
                                              actionHandler: {
                                                            let vc = self.sceneBuildManager.buildResultScreen(resultType: .close,
                                                                                                              navigationBarTitle: item.navigationBarTitle,
                                                                                                              calculationType: item.calculationType,
                                                                                                              defaulValueCoefficients: item.defaultCoef,
                                                                                                              valueCoefficients: item.valueCoef,
                                                                                                              choiceCoefficients: item.choiceCoef,
                                                                                                              checkboxCoefficients: item.checkboxСoef)
                                                            self.viewController?.navigationController?.pushViewController(vc,
                                                                                                                          animated: true)
            })
        }
        return result
    }
    
    func openCell(actionHandler: () -> Void) {
        actionHandler()
    }
}
