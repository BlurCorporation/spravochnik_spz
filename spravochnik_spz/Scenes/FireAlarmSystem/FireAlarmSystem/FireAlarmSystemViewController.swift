//
//  FireAlarmSystemViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - FireAlarmSystemViewProtocol

protocol FireAlarmSystemViewProtocol: UIViewController {}

// MARK: - FireAlarmSystemViewController

final class FireAlarmSystemViewController: UIViewController {
    var presenter: FireAlarmSystemPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - FireAlarmSystemViewProtocol Impl

extension FireAlarmSystemViewController: FireAlarmSystemViewProtocol {}

// MARK: - PrivateMethods

private extension FireAlarmSystemViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
