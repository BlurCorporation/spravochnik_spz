//
//  SavedCalculationsViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - SavedCalculationsViewProtocol

protocol SavedCalculationsViewProtocol: UIViewController {}

// MARK: - SavedCalculationsViewController

final class SavedCalculationsViewController: UIViewController {
    var presenter: SavedCalculationsPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - SavedCalculationsViewProtocol Impl

extension SavedCalculationsViewController: SavedCalculationsViewProtocol {}

// MARK: - PrivateMethods

private extension SavedCalculationsViewController {
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
