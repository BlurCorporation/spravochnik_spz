//
//  NotificationSystemResultsViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - NotificationSystemResultsViewProtocol

protocol NotificationSystemResultsViewProtocol: UIViewController {}

// MARK: - NotificationSystemResultsViewController

final class NotificationSystemResultsViewController: UIViewController {
    var presenter: NotificationSystemResultsPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - NotificationSystemResultsViewProtocol Impl

extension NotificationSystemResultsViewController: NotificationSystemResultsViewProtocol {}

// MARK: - PrivateMethods

private extension NotificationSystemResultsViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
