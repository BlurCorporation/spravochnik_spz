//
//  ResetPasswordViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - ResetPasswordViewProtocol

protocol ResetPasswordViewProtocol: UIViewController {}

// MARK: - ResetPasswordViewController

final class ResetPasswordViewController: UIViewController {
    var presenter: ResetPasswordPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - ResetPasswordViewProtocol Impl

extension ResetPasswordViewController: ResetPasswordViewProtocol {}

// MARK: - PrivateMethods

private extension ResetPasswordViewController {
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
