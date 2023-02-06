//
//  RegisterViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - RegisterViewProtocol

protocol RegisterViewProtocol: UIViewController {}

// MARK: - RegisterViewController

final class RegisterViewController: UIViewController {
    var presenter: RegisterPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - RegisterViewProtocol Impl

extension RegisterViewController: RegisterViewProtocol {}

// MARK: - PrivateMethods

private extension RegisterViewController {
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
