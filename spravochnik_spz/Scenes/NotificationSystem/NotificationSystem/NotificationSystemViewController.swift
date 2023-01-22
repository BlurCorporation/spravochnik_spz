//
//  NotificationSystemViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - NotificationSystemViewProtocol

protocol NotificationSystemViewProtocol: UIViewController {}

// MARK: - NotificationSystemViewController

final class NotificationSystemViewController: UIViewController {
    var presenter: NotificationSystemPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - NotificationSystemViewProtocol Impl

extension NotificationSystemViewController: NotificationSystemViewProtocol {}

// MARK: - PrivateMethods

private extension NotificationSystemViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
