//
//  ProfileViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - ProfileViewProtocol

protocol ProfileViewProtocol: UIViewController {
    func changeUsernameLabel(_ name: String)
}

// MARK: - ProfileViewController

final class ProfileViewController: UIViewController {
    var presenter: ProfilePresenterProtocol?
    
    // MARK: - PrivateProperties

    ///
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        let image = Constants.Images.logoutImage
        button.setImage(image,
                        for: .normal)
        button.layer.borderWidth = Constants.Sizes.borderWidth
        button.layer.borderColor = Constants.Colors.lightGray.cgColor
        button.layer.cornerRadius = 7
        button.addTarget(self,
                         action: #selector(logoutButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = Constants.Images.logoImage
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "username".localized
        label.font = Constants.Fonts.h2
        return label
    }()
    
    private let logoUsernameStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var themeButton: CustomProfileButton = {
        let button = CustomProfileButton(size: .big)
        button.setTitleLabels(header: "appThemeButtonText".localized,
                              theme: "colorAppThemeButtonText".localized)
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(themeButtonPressed))
        button.addGestureRecognizer(tap)
        return button
    }()
    
    private lazy var updateDataButton: CustomProfileButton = {
        let button = CustomProfileButton(size: .small)
        button.setTitleLabels(header: "updateDataButtonText".localized)
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(updateDataButtonPressed))
        button.addGestureRecognizer(tap)
        return button
    }()
    
    private lazy var conditionButton: CustomProfileButton = {
        let button = CustomProfileButton(size: .small)
        button.setTitleLabels(header: "usingConditionsButtonText".localized)
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(conditionButtonPressed))
        button.addGestureRecognizer(tap)
        return button
    }()
    
    private lazy var privacyButton: CustomProfileButton = {
        let button = CustomProfileButton(size: .small)
        button.setTitleLabels(header: "privacyPolicyButtonText".localized)
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(privacyButtonPressed))
        button.addGestureRecognizer(tap)
        return button
    }()

    private lazy var deleteAccountButton: CustomProfileButton = {
        let button = CustomProfileButton(size: .small)
        button.setTitleLabels(header: "deleteAccountButtonText".localized)
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(deleteAccountButtonPressed))
        button.addGestureRecognizer(tap)
        return button
    }()
    
    private let buttonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let commonButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @objc private func logoutButtonPressed() {
        presenter?.logoutButtonPressed()
    }
    
    @objc private func themeButtonPressed() {
        themeButton.pushAnimate { [weak self] in
            self?.presenter?.themeButtonPressed()
        }
    }
    
    @objc private func updateDataButtonPressed() {
        updateDataButton.pushAnimate { [weak self] in
            self?.presenter?.updateDataButtonPressed()
        }
    }
    
    @objc private func conditionButtonPressed() {
        conditionButton.pushAnimate { [weak self] in
            self?.presenter?.conditionButtonPressed()
        }
    }
    
    @objc private func privacyButtonPressed() {
        privacyButton.pushAnimate { [weak self] in
            self?.presenter?.privacyButtonPressed()
        }
    }
    
    @objc private func deleteAccountButtonPressed() {
        deleteAccountButton.pushAnimate { [weak self] in
            self?.presenter?.deleteAccountButtonPressed()
        }
    }
}

// MARK: - ProfileViewProtocol Impl

extension ProfileViewController: ProfileViewProtocol {
    func changeUsernameLabel(_ name: String) {
        usernameLabel.text = name
    }
}

// MARK: - PrivateMethods

private extension ProfileViewController {
    func setupViewController() {
        addSubViews()
        setupNavBar()
        setupConstraints()
        view.backgroundColor = .systemBackground
        themeButton.isHidden = true
        updateDataButton.isHidden = true
    }
    
    func setupNavBar() {
        let barButton = UIBarButtonItem(customView: logoutButton)
        navigationItem.rightBarButtonItem = barButton
    }
    
    func addSubViews() {
        logoUsernameStack.addArrangedSubviews(logoImageView,
                                             usernameLabel)
        buttonsStack.addArrangedSubviews(themeButton,
                                         updateDataButton,
                                         conditionButton,
                                         privacyButton,
                                         deleteAccountButton)
        commonButtonsStack.addArrangedSubviews(logoUsernameStack,
                                                    buttonsStack)
        view.addSubviews(commonButtonsStack)
    }
    
    func setupConstraints() {
        let offset = CGFloat(16)
        let logoutButtonSize = CGFloat(40)
        let logoImageSize = CGFloat(80)
        
        NSLayoutConstraint.activate([
            logoutButton.heightAnchor.constraint(equalToConstant: logoutButtonSize),
            logoutButton.widthAnchor.constraint(equalToConstant: logoutButtonSize),
            
            commonButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commonButtonsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                          constant: Constants.Constraints.commonStackViewTopOffset),
            
            buttonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                  constant: offset),
            buttonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                   constant: -offset),
            
            logoImageView.heightAnchor.constraint(equalToConstant: logoImageSize),
            logoImageView.widthAnchor.constraint(equalToConstant: logoImageSize),
        ])
    }
}
