//
//  ResultViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: -  ResultViewProtocol

protocol  ResultViewProtocol: UIViewController {}

// MARK: -  ResultViewController

final class  ResultViewController: UIViewController {
    var presenter:  ResultPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: -  ResultSystemViewProtocol Impl

extension  ResultViewController: ResultViewProtocol {}

// MARK: - PrivateMethods

private extension  ResultViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .orange
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
