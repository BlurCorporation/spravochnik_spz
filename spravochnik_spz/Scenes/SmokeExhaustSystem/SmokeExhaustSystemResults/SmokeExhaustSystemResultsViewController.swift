//
//  SmokeExhaustSystemResultsViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - SmokeExhaustSystemResultsViewProtocol

protocol SmokeExhaustSystemResultsViewProtocol: UIViewController {}

// MARK: - SmokeExhaustSystemResultsViewController

final class SmokeExhaustSystemResultsViewController: UIViewController {
    var presenter: SmokeExhaustSystemResultsPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - SmokeExhaustSystemResultsViewProtocol Impl

extension SmokeExhaustSystemResultsViewController: SmokeExhaustSystemResultsViewProtocol {}

// MARK: - PrivateMethods

private extension SmokeExhaustSystemResultsViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
