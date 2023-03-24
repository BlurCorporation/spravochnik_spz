//
//  AlertViewController.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 23.03.2023.
//

import UIKit

// MARK: - CalculationViewProtocol

protocol AlertViewProtocol: UIViewController {
}

// MARK: - CalculationViewController

final class AlertViewController: UIViewController {
    var presenter: AlertPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupViewController()
    }
    
    // MARK: - Action
    
    
}

// MARK: - AlertViewProtocol Impl

extension AlertViewController: AlertViewProtocol {
}

// MARK: - PrivateMethods

private extension AlertViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .red
        navigationController?.isNavigationBarHidden = true
    }
    
    func addSubViews() { }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
}
