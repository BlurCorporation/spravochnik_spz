//
//  ModuleFirefightingSystemResultsViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - ModuleFirefightingSystemResultsViewProtocol

protocol ModuleFirefightingSystemResultsViewProtocol: UIViewController {}

// MARK: - ModuleFirefightingSystemResultsViewController

final class ModuleFirefightingSystemResultsViewController: UIViewController {
    var presenter: ModuleFirefightingSystemResultsPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - ModuleFirefightingSystemResultsViewProtocol Impl

extension ModuleFirefightingSystemResultsViewController: ModuleFirefightingSystemResultsViewProtocol {}

// MARK: - PrivateMethods

private extension ModuleFirefightingSystemResultsViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
