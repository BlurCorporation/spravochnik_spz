//
//  FireAlarmSystemResultsViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - FireAlarmSystemResultsViewProtocol

protocol FireAlarmSystemResultsViewProtocol: UIViewController {}

// MARK: - FireAlarmSystemResultsViewController

final class FireAlarmSystemResultsViewController: UIViewController {
    var presenter: FireAlarmSystemResultsPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - FireAlarmSystemResultsViewProtocol Impl

extension FireAlarmSystemResultsViewController: FireAlarmSystemResultsViewProtocol {}

// MARK: - PrivateMethods

private extension FireAlarmSystemResultsViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
