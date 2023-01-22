//
//  StartViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - StartViewProtocol

protocol StartViewProtocol: UIViewController {}

// MARK: - StartViewController

final class StartViewController: UIViewController {
    var presenter: StartPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - StartViewProtocol Impl

extension StartViewController: StartViewProtocol {}

// MARK: - PrivateMethods

private extension StartViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
