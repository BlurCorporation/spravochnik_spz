//
//  SecurityAlarmSystemResultsViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - SecurityAlarmSystemResultsViewProtocol

protocol SecurityAlarmSystemResultsViewProtocol: UIViewController {}

// MARK: - SecurityAlarmSystemResultsViewController

final class SecurityAlarmSystemResultsViewController: UIViewController {
    var presenter: SecurityAlarmSystemResultsPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - SecurityAlarmSystemResultsViewProtocol Impl

extension SecurityAlarmSystemResultsViewController: SecurityAlarmSystemResultsViewProtocol {}

// MARK: - PrivateMethods

private extension SecurityAlarmSystemResultsViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
