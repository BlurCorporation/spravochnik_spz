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
