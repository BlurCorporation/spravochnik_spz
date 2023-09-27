//
//  SavedCalculationsPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

struct SavedCalculationsCellData {
    let key: String
    let value: Calculation
}

// MARK: - SavedCalculationsPresenterProtocol

protocol SavedCalculationsTablePresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func openCell(actionHandler: () -> Void)
    func deleteCalc(uuid: String)
}

// MARK: - SavedCalculationsPresenter

final class SavedCalculationsTablePresenter {
    weak var viewController: SavedCalculationsViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let firestore: FirebaseServiceProtocol
    private var data = [SavedCalculationsCellData]()//[Calculation(address: "",
//                                                   date: "",
//                                                   stages: "",
//                                                   cost: 0,
//                                                   navigationBarTitle: "",
//                                                   calculationType: .fireAlarmSystem,
//                                                   valueCoef: [ValueСoefficientModel(type: .lengthOfThePerimeter, value: 20)],
//                                                   choiceCoef: [ChoiceCoefficientModel(type: .numberOfFirePumpGroups, itemIndex: 3)],
//                                                   defaultCoef: [DefaultCoefficientValueModel(type: .inflationRate, value: nil)],
//                                                   checkboxСoef: [CheckboxСoefficientModel(type: .availabilityOfAlertsForIndividualEvacuationZones,                                               isSelected: true)],
//                                                   calculationResult: [CalculationResultModel(title: TitleType.stageP,                                                                               description: "",
//                                                                                              prices: [PriceModel(type: PriceType.withVat,
//                                                                                                                  value: 0.5)])])]
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable,
         firestore: FirebaseServiceProtocol) {
        self.sceneBuildManager = sceneBuildManager
        self.firestore = firestore
        testSetGetCalcFromFB()
    }
    
    // Тест работы с ФБ через репозиторий, удалить после
    private func testSetGetCalcFromFB() {
        let fbService: FirebaseServiceProtocol = FirebaseService()
        let testCalcModel: [Calculation] = [Calculation(address: "Краснодар",
                                                        date: "01.01.2022",
                                                        stages: "2-х стадийный",
                                                        cost: 89_006.53,
                                                        navigationBarTitle: "111",
                                                        calculationType: .fireAlarmSystem,
                                                        valueCoef: [ValueСoefficientModel(type: .lengthOfThePerimeter, value: 20)],
                                                        choiceCoef: [ChoiceCoefficientModel(type: .numberOfFirePumpGroups, itemIndex: 3)],
                                                        defaultCoef: [DefaultCoefficientValueModel(type: .inflationRate, value: 37)],
                                                        checkboxСoef: [CheckboxСoefficientModel(type: .availabilityOfAlertsForIndividualEvacuationZones,                                                isSelected: true)],
                                                        calculationResult: [CalculationResultModel(title: TitleType.stageP,                                                                                description: "",
                                                                                                   prices: [PriceModel(type: PriceType.withVat,
                                                                                                                       value: 0.5)])])]
        
//        let calcModel = CalculationModel(userID: firestore.getUserID(), calcName: "Correct Coefs", calculation: testCalcModel)
//        FirebaseRepository(firebaseService: fbService).setCalculation(calcModel: calcModel) { result in
//            switch result {
//            case .success(let calc):
//                print("MODEL SET: ", calc)
//            case .failure(let error):
//                print(error)
//            }
//        }

//        FirebaseRepository(firebaseService: fbService).getCalculation(userID: "UserID 1", calcName: "Correct Coefs2") { result in
//            switch result {
//            case .success(let calc):
//                self.data = calc
//                print("MODEL GET: ", calc)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        FirebaseRepository(firebaseService: fbService).getAllCalculations(userID: firestore.getUserID()) { result in
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
    func deleteCalc(uuid: String) {
        let fbService: FirebaseServiceProtocol = FirebaseService()
        FirebaseRepository(firebaseService: fbService).deleteCalculation(userID: firestore.getUserID(), calcName: uuid) { result in
            switch result {
            case .success(let success):
                print("успешно удалено")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func viewDidLoad() {
        self.viewController?.update(dataSource: self.makeData())
    }
    
    func viewWillAppear() {
        testSetGetCalcFromFB()
        self.viewController?.update(dataSource: self.makeData())
    }
    
    private func makeData()-> [SavedCalculationsCellModelProtocol] {
        
        // TODO: - исправить это
        if data.isEmpty {
            return []
        }
        
        return self.data.lazy.enumerated().compactMap { (index, item) in
            
            var background = Constants.Images.empty
            switch index % 3 {
            case 0:
                background = Constants.Images.blackBackground
            case 1:
                background = Constants.Images.grayBackground
            case 2:
                background = Constants.Images.brownBackground
            default:
                background = Constants.Images.empty
            }
            
            var typeIcon = Constants.Images.empty
            switch item.value.calculationType {
            case .securityAlarm:
                typeIcon = Constants.Images.securityAlarmIcon
            case .perimeterSecurityAlarm:
                typeIcon = Constants.Images.perimetrAlarmIcon
            case .fireAlarmSystem:
                typeIcon = Constants.Images.fireAlarmIcon
            case .fireWarningSystem:
                typeIcon = Constants.Images.notificationIcon
            case .modularFireExtinguishingSystems:
                typeIcon = Constants.Images.moduleFirefightingIcon
            case .smokeRemovalControlSystem:
                typeIcon = Constants.Images.smokeExhaustIcon
            case .pumpingStationsOfFireExtinguishingInstallations:
                typeIcon = Constants.Images.firePumpIcon
            }
            
            return SavedCalculationsCellModel(uuid: item.key,
                                              address: item.value.address,
                                              system: item.value.calculationType.title,
                                              date: item.value.date,
                                              stages: item.value.stages,
                                              cost: item.value.cost,
                                              image: typeIcon,
                                              backgroundImage: background,
                                              type: item.value.calculationType,
                                              actionHandler: {
                                                            let vc = self.sceneBuildManager.buildResultScreen(resultType: .close,
                                                                                                              navigationBarTitle: item.value.navigationBarTitle,
                                                                                                              calculationType: item.value.calculationType,
                                                                                                              defaulValueCoefficients: item.value.defaultCoef,
                                                                                                              valueCoefficients: item.value.valueCoef,
                                                                                                              choiceCoefficients: item.value.choiceCoef,
                                                                                                              checkboxCoefficients: item.value.checkboxСoef)
                                                            self.viewController?.navigationController?.pushViewController(vc,
                                                                                                                          animated: true)
            })
        }
    }
    
    func openCell(actionHandler: () -> Void) {
        actionHandler()
    }
}
