//
//  AlertPresenter.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 23.03.2023.
//


// MARK: - AlertPresenterProtocol

protocol AlertPresenterProtocol: AnyObject {
    func viewDidLoad()
}

// MARK: - ALertPresenter

final class AlertPresenter {
    weak var viewController: AlertViewProtocol?
    
    // MARK: PrivateProperties
    
    // MARK: - Initializer
    
    init() {}
}

// MARK: - AlertPresenterExtension

extension AlertPresenter: AlertPresenterProtocol {
    func viewDidLoad() {
        
    }
    
}


enum AlertType {
    case clear
    case singleField
    case threeHorizontalButtons
    case threeVerticalButtons
    case fourHorizontalButtons
    case fiveHorizontalButtons
}
