//
//   PerimeterAlarmSystemResultsViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - PerimeterAlarmSystemResultsViewProtocol

protocol PerimeterAlarmSystemResultsViewProtocol: UIViewController {}

// MARK: - PerimeterAlarmSystemResultsViewController

final class PerimeterAlarmSystemResultsViewController: UIViewController {
    var presenter: PerimeterAlarmSystemResultsPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - PerimeterAlarmSystemResultsViewProtocol Impl

extension PerimeterAlarmSystemResultsViewController: PerimeterAlarmSystemResultsViewProtocol {}

// MARK: - PrivateMethods

private extension PerimeterAlarmSystemResultsViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
