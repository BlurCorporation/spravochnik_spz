//
//  MainPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - MainPresenterProtocol

protocol MainPresenterProtocol: AnyObject {
    func cellSet(object: MainCollectionViewModel,
                 cell: MainCollectionViewCell)
    func helpButtonPressed()
    func openCalculationCellSelected(index: Int)
}

// MARK: - MainPresenter

final class MainPresenter {
    weak var viewController: MainViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - MainPresenterExtension

extension MainPresenter: MainPresenterProtocol {
    func cellSet(object: MainCollectionViewModel,
                 cell: MainCollectionViewCell) {
        cell.set(object: object)
    }
    
    func helpButtonPressed() {
        print(#function)
    }
    
    func openCalculationCellSelected(index: Int) {
        switch index {
        case 0:
            print(index)
        case 1:
            print(index)
        case 2:
            print(index)
        case 3:
            print(index)
        case 4:
            print(index)
        case 5:
            print(index)
        case 6:
            print(index)
        default: fatalError()

        }
    }
}
