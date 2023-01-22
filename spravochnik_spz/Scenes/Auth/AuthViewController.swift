//
//  AuthViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - AuthViewProtocol

protocol AuthViewProtocol: UIViewController {}

// MARK: - AuthViewController

final class AuthViewController: UIViewController {
    var presenter: AuthPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - AuthViewProtocol Impl

extension AuthViewController: AuthViewProtocol {}

// MARK: - PrivateMethods

private extension AuthViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
