//
//  SecurityAlarmSystemViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - SecurityAlarmSystemViewProtocol

protocol SecurityAlarmSystemViewProtocol: UIViewController {}

// MARK: - SecurityAlarmSystemViewController

final class SecurityAlarmSystemViewController: UIViewController {
    var presenter: SecurityAlarmSystemPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - SecurityAlarmSystemViewProtocol Impl

extension SecurityAlarmSystemViewController: SecurityAlarmSystemViewProtocol {}

// MARK: - PrivateMethods

private extension SecurityAlarmSystemViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .systemBackground
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
