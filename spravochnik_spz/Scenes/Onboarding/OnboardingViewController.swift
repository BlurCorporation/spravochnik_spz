//
//  OnboardingViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - OnboardingViewProtocol

protocol OnboardingViewProtocol: UIViewController {}

// MARK: - OnboardingViewController

final class OnboardingViewController: UIViewController {
    var presenter: OnboardingPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - OnboardingViewProtocol Impl

extension OnboardingViewController: OnboardingViewProtocol {}

// MARK: - PrivateMethods

private extension OnboardingViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
