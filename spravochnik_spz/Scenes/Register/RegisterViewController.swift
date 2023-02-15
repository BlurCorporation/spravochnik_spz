//
//  RegisterViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - RegisterViewProtocol

protocol RegisterViewProtocol: UIViewController {}

// MARK: - RegisterViewController

final class RegisterViewController: UIViewController {
    var presenter: RegisterPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Constants.Images.backButtomImage,
                        for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let nameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = Constants.PlaceHolders.name
        return textField
    }()
    
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = Constants.PlaceHolders.eMail
        return textField
    }()
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = Constants.PlaceHolders.password
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let retypePasswordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = Constants.PlaceHolders.retypePassword
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var registerButton: CustomButton = {
        let button = CustomButton(mode: .black)
        button.setTitle(Constants.TextButtons.registerButton, for: .normal)
        button.addTarget(self,
                         action: #selector(registerButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let infoWithLinksLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.TextLabels.infoWithLinksLabelText
        label.font = UIFont.systemFont(ofSize: Constants.Sizes.infoLabelFont)
        label.textColor = Constants.Colors.grey
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var leadingLineView = lineView(color: Constants.Colors.lightGrey)
    
    private let authLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.TextLabels.authLabelText
        label.font = UIFont.boldSystemFont(ofSize: Constants.Sizes.registerFont)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var trailingLineView = lineView(color: Constants.Colors.lightGrey)
    
    private let authStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var appleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(Constants.Images.appleButtonImage,
                                  for: .normal)
        button.addTarget(self, action: #selector(appleButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(Constants.Images.googleButtonImage,
                                  for: .normal)
        button.addTarget(self, action: #selector(googleButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(Constants.Images.facebookButtonImage,
                                  for: .normal)
        button.addTarget(self, action: #selector(facebookButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let authButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    private let middleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        return stackView
    }()
    
    private let infoBottomLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TextLabels.infoRegisterBottomLabelText
        label.font = UIFont.systemFont(ofSize: Constants.Sizes.infoLabelFont)
        label.textColor = Constants.Colors.grey
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: Constants.Sizes.registerFont)
        button.setTitle(Constants.TextButtons.loginButton,
                        for: .normal)
        button.addTarget(self, action: #selector(loginButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func touchesBegan(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {
        self.view.endEditing(true)
    }
    
    // MARK: - Action
    
    @objc private func backButtonPressed() {
        presenter?.backButtonPressed()
    }

    @objc private func registerButtonPressed() {
        registerButton.pushAnimate { [weak self] in
            self?.presenter?.registerButtonPressed()
        }
    }
    
    @objc private func appleButtonPressed() {
        presenter?.appleButtonPressed()
    }
    
    @objc private func googleButtonPressed() {
        presenter?.googleButtonPressed()
    }
    
    @objc private func facebookButtonPressed() {
        presenter?.facebookButtonPressed()
    }
    
    @objc private func loginButtonPressed() {
        presenter?.loginButtonPressed()
    }
}

// MARK: - RegisterViewProtocol Impl

extension RegisterViewController: RegisterViewProtocol {}

// MARK: - PrivateMethods

private extension RegisterViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        setupNavigationController()
        view.backgroundColor = .systemBackground
    }
    
    func setupNavigationController() {
        title = Constants.NavigationController.registerTitle
        navigationItem.setHidesBackButton(true,
                                          animated: true)
        let barButtom = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButtom
    }
    
    func addSubViews() {
        view.addSubviews(topStackView,
                         middleStackView,
                         bottomStackView)
        
        topStackView.addArrangedSubviews(textFieldStackView,
                                         registerButton)
        
        textFieldStackView.addArrangedSubviews(nameTextField,
                                               emailTextField,
                                               passwordTextField,
                                               retypePasswordTextField)
        
        middleStackView.addArrangedSubviews(infoWithLinksLabel,
                                            authStackView,
                                            authButtonStackView)
        
        authStackView.addArrangedSubviews(leadingLineView,
                                          authLabel,
                                          trailingLineView)
        
        authButtonStackView.addArrangedSubviews(appleButton,
                                                googleButton,
                                                facebookButton)
        
        bottomStackView.addArrangedSubviews(infoBottomLabel,
                                            loginButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textFieldStackView.heightAnchor.constraint(equalToConstant: Constants.Constraints.registerTextFieldStackViewHeight),
            registerButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight),
            leadingLineView.heightAnchor.constraint(equalToConstant: Constants.Constraints.registerLineViewHeight),
            trailingLineView.heightAnchor.constraint(equalToConstant: Constants.Constraints.registerLineViewHeight),
            
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                  constant: Constants.Constraints.sideOffset),
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                   constant: -Constants.Constraints.sideOffset),
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                              constant: Constants.Constraints.registerTopStackViewTopOffset),
            
            middleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                     constant: Constants.Constraints.registerMiddleStackViewSideOffset),
            middleStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                      constant: -Constants.Constraints.registerMiddleStackViewSideOffset),
            middleStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor,
                                                 constant: Constants.Constraints.registerMiddleStackViewTopOffset),
            
            bottomStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                    constant: -Constants.Constraints.lowerOffset)
        ])
    }
}
