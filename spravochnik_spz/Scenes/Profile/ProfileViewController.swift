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

    ///
    private var logoutButton: UIButton = {
        let button = UIButton()
        let image = Constants.Images.logoutImage
        button.setImage(image,
                        for: .normal)
        button.layer.borderWidth = Constants.Sizes.borderWidth
        button.layer.borderColor = Constants.Colors.lightGray.cgColor
        button.layer.cornerRadius = 7
        button.addTarget(nil,
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
        label.text = Constants.TextLabels.username
        label.font = Constants.Fonts.bigTableHeaderFont
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
        button.setTitleLabels(header: Constants.TextButtons.appThemeButtonText,
                              theme: Constants.TextButtons.colorAppThemeButtonText)
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(themeButtonPressed))
        button.addGestureRecognizer(tap)
        return button
    }()
    
    private lazy var updateDataButton: CustomProfileButton = {
        let button = CustomProfileButton(size: .small)
        button.setTitleLabels(header: Constants.TextButtons.updateDataButtonText)
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(updateDataButtonPressed))
        button.addGestureRecognizer(tap)
        return button
    }()
    
    private lazy var conditionButton: CustomProfileButton = {
        let button = CustomProfileButton(size: .small)
        button.setTitleLabels(header: Constants.TextButtons.usingConditionsButtonText)
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(conditionButtonPressed))
        button.addGestureRecognizer(tap)
        return button
    }()
    
    private lazy var privacyButton: CustomProfileButton = {
        let button = CustomProfileButton(size: .small)
        button.setTitleLabels(header: Constants.TextButtons.privacyPolicyButtonText)
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(privacyButtonPressed))
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
    
    private let customView: CustomAlert = {
        let view = CustomAlert(type: .clear)
        view.setupClearView(title: "123", leftButtonTitle: "213", rightButtonTitle: "123")
        return view
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        
        title = "123"
        customView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
//        let customView = CustomAlert()//frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        UIApplication.shared.windows.first?.addSubview(customView)
        
        
//        customView.setupClearView(title: "123", leftButtonTitle: "213", rightButtonTitle: "123")
        
        
//        customView.leftButton.addTarget(self, action: #selector(close), for: .touchUpInside)
//        self.view.addSubview(customView)
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
}

// MARK: - ProfileViewProtocol Impl

extension ProfileViewController: ProfileViewProtocol {}

// MARK: - PrivateMethods

private extension ProfileViewController {
    func setupViewController() {
        addSubViews()
        setupNavBar()
        setupConstraints()
        view.backgroundColor = .systemBackground
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
                                         privacyButton)
        commonButtonsStack.addArrangedSubviews(logoUsernameStack,
                                                    buttonsStack)
        view.addSubviews(commonButtonsStack)
    }
    
    func setupConstraints() {
        let offset = CGFloat(16)
        let logoutButtonSize = CGFloat(40)
        let logoImageSize = CGFloat(80)
        
        NSLayoutConstraint.activate([
//            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            customView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            customView.topAnchor.constraint(equalTo: view.topAnchor),

            
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
