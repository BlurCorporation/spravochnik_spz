//
//  SmokeExhaustSystemViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - SmokeExhaustSystemViewProtocol

protocol SmokeExhaustSystemViewProtocol: UIViewController {}

// MARK: - SmokeExhaustSystemViewController

final class SmokeExhaustSystemViewController: UIViewController {
    var presenter: SmokeExhaustSystemPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - SmokeExhaustSystemViewProtocol Impl

extension SmokeExhaustSystemViewController: SmokeExhaustSystemViewProtocol {}

// MARK: - PrivateMethods

private extension SmokeExhaustSystemViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
