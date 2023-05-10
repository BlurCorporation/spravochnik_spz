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
