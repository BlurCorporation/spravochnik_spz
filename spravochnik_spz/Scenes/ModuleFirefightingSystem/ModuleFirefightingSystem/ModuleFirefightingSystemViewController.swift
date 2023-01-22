//
//  ModuleFirefightingSystemViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - ModuleFirefightingSystemViewProtocol

protocol ModuleFirefightingSystemViewProtocol: UIViewController {}

// MARK: - ModuleFirefightingSystemViewController

final class ModuleFirefightingSystemViewController: UIViewController {
    var presenter: ModuleFirefightingSystemPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - ModuleFirefightingSystemViewProtocol Impl

extension ModuleFirefightingSystemViewController: ModuleFirefightingSystemViewProtocol {}

// MARK: - PrivateMethods

private extension ModuleFirefightingSystemViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
