//
//  FirePumpStationResultsViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - FirePumpStationViewProtocol

protocol FirePumpStationResultsViewProtocol: UIViewController {}

// MARK: - FirePumpStationResultsViewController

final class FirePumpStationResultsViewController: UIViewController {
    var presenter: FirePumpStationResultsPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - FirePumpStationResultsViewProtocol Impl

extension FirePumpStationResultsViewController: FirePumpStationResultsViewProtocol {}

// MARK: - PrivateMethods

private extension FirePumpStationResultsViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
