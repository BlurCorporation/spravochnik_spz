//
//  FirePumpStationViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - FirePumpStationViewProtocol

protocol FirePumpStationViewProtocol: UIViewController {}

// MARK: - FirePumpStationViewController

final class FirePumpStationViewController: UIViewController {
    var presenter: FirePumpStationPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - FirePumpStationViewProtocol Impl

extension FirePumpStationViewController: FirePumpStationViewProtocol {}

// MARK: - PrivateMethods

private extension FirePumpStationViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
