//
//  SplashViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - SplashViewProtocol

protocol SplashViewProtocol: UIViewController {}

// MARK: - SplashViewController

final class SplashViewController: UIViewController {
    var presenter: SplashPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - SplashViewProtocol Impl

extension SplashViewController: SplashViewProtocol {}

// MARK: - PrivateMethods

private extension SplashViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .systemTeal
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
