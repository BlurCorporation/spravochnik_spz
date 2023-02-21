//
//  ProfileViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - ProfileViewProtocol

protocol ProfileViewProtocol: UIViewController {}

// MARK: - ProfileViewController

final class ProfileViewController: UIViewController {
    var presenter: ProfilePresenterProtocol?
    
    // MARK: - PrivateProperties
    private let customView: CustomProfileView = {
        let view = CustomProfileView(firstTitle: Constants.TextButtons.appThemeButtonText,
                                     secondTitle: Constants.TextButtons.colorAppThemeButtonText)
        return view
    }()
    
    private let themeButton: UIButton = {
        let button = UIButton()
        let subview = CustomProfileView(firstTitle: Constants.TextButtons.appThemeButtonText,
                                        secondTitle: Constants.TextButtons.colorAppThemeButtonText)
        button.addSubviews(subview)
        subview.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(red: 0.812,
                                           green: 0.816,
                                           blue: 0.82,
                                           alpha: 1).cgColor
        button.layer.cornerRadius = 11
        return button
    }()
    
    private let updateDataButton: UIButton = {
        let button = UIButton()
        let subview = CustomProfileView(firstTitle: Constants.TextButtons.changeDataButtonText, secondTitle: nil)
        button.addSubviews(subview)
        subview.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(red: 0.812,
                                           green: 0.816,
                                           blue: 0.82,
                                           alpha: 1).cgColor
        button.layer.cornerRadius = 11
        return button
    }()
    
    private let conditionButton: UIButton = {
        let button = UIButton()
        let subview = CustomProfileView(firstTitle: Constants.TextButtons.usingConditionsButtonText, secondTitle: nil)
        button.addSubviews(subview)
        subview.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(red: 0.812,
                                           green: 0.816,
                                           blue: 0.82,
                                           alpha: 1).cgColor
        button.layer.cornerRadius = 11
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        let subview = CustomProfileView(firstTitle: Constants.TextButtons.privacyPolicyButtonText, secondTitle: nil)
        button.addSubviews(subview)
        subview.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(red: 0.812,
                                           green: 0.816,
                                           blue: 0.82,
                                           alpha: 1).cgColor
        button.layer.cornerRadius = 11
        return button
    }()
    
    private let buttonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - ProfileViewProtocol Impl

extension ProfileViewController: ProfileViewProtocol {}

// MARK: - PrivateMethods

private extension ProfileViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .systemBackground
    }
    
    func addSubViews() {
//        themeButton.addSubview(customView)
        buttonsStack.addArrangedSubviews(themeButton, updateDataButton, conditionButton, privacyButton)
        view.addSubviews(buttonsStack)
    }
    
    func setupConstraints() {
        let offset = CGFloat(16)
        let bigButton = CGFloat(69)
        let smallButton = CGFloat(50)
        NSLayoutConstraint.activate([
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                  constant: offset),
            buttonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                   constant: -offset),
            
            themeButton.heightAnchor.constraint(equalToConstant: bigButton),
            updateDataButton.heightAnchor.constraint(equalToConstant: smallButton),
            conditionButton.heightAnchor.constraint(equalToConstant: smallButton),
            privacyButton.heightAnchor.constraint(equalToConstant: smallButton),
            
//            customView.widthAnchor.constraint(equalTo: themeButton.widthAnchor)
        ])
    }
}
