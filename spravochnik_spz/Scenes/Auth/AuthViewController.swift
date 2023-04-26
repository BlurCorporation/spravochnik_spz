//
//  AuthViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - AuthViewProtocol

protocol AuthViewProtocol: UIViewController {
    func setupAuth()
    func setupRegister()
}

// MARK: - AuthViewController

final class AuthViewController: UIViewController {
    var presenter: AuthPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Constants.Images.backButtomImage,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(backButtonPressed),
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
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var identifireButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.mode = .black
        button.addTarget(self,
                         action: #selector(identifireButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let infoWithLinksLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.TextLabels.infoWithLinksLabelText
        label.font = Constants.Fonts.infoWithLinksLabelFont
        label.textColor = Constants.Colors.lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var leadingLineView = lineView(color: Constants.Colors.lightGray)
    
    private let authLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.TextLabels.authLabelText
        label.font = Constants.Fonts.authLabelFont
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var trailingLineView = lineView(color: Constants.Colors.lightGray)
    
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
        button.addTarget(self,
                         action: #selector(appleButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(Constants.Images.googleButtonImage,
                                  for: .normal)
        button.addTarget(self,
                         action: #selector(googleButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    //Запрещён на территории РФ
//    private lazy var facebookButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setBackgroundImage(Constants.Images.facebookButtonImage,
//                                  for: .normal)
//        button.addTarget(self,
//                         action: #selector(facebookButtonPressed),
//                         for: .touchUpInside)
//        return button
//    }()
    
    private let authButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .equalCentering
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
        label.font = Constants.Fonts.infoWithLinksLabelFont
        label.textColor = Constants.Colors.lightGray
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.black,
                             for: .normal)
        button.titleLabel?.font = Constants.Fonts.infoWithLinksLabelFont
        button.addTarget(self,
                         action: #selector(loginButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.black,
                             for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = Constants.Fonts.infoPasswordFont
        button.setTitle(Constants.TextButtons.forgotPassword,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(forgotPasswordButtonPressed),
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
        presenter?.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Action
    
    @objc private func backButtonPressed() {
        presenter?.backButtonPressed()
    }

    @objc private func identifireButtonPressed() {
        presenter?.identifireButtonPressed(email: emailTextField.text, password: passwordTextField.text, repeatPassword: retypePasswordTextField.text)
    }
    
    @objc private func appleButtonPressed() {
        presenter?.appleButtonPressed()
    }
    
    @objc private func googleButtonPressed() {
        presenter?.googleButtonPressed()
    }
    
//    @objc private func facebookButtonPressed() {
//        presenter?.facebookButtonPressed()
//    }
    
    @objc private func loginButtonPressed() {
        presenter?.loginButtonPressed()
    }
    
    @objc private func forgotPasswordButtonPressed() {
        presenter?.forgotPasswordButtonPressed()
    }
}

// MARK: - AuthViewProtocol Impl

extension AuthViewController: AuthViewProtocol {
    func setupAuth() {
        title = Constants.NavigationController.authTitle
        identifireButton.setTitle(Constants.TextButtons.loginButton,
                                  for: .normal)
        nameTextField.isHidden = true
        retypePasswordTextField.isHidden = true
        infoWithLinksLabel.isHidden = true
        infoBottomLabel.text = Constants.TextLabels.infoAuthBottomLabelText
        loginButton.setTitle(Constants.TextButtons.registerButton,
                        for: .normal)
        
    }
    
    func setupRegister() {
        title = Constants.NavigationController.registerTitle
        identifireButton.setTitle(Constants.TextButtons.registerButton,
                                  for: .normal)
        loginButton.setTitle(Constants.TextButtons.loginButton,
                        for: .normal)
        forgotPasswordButton.isHidden = true
    }
}

// MARK: - PrivateMethods

private extension AuthViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        setupNavigationController()
        view.backgroundColor = .systemBackground
    }
    
    func setupNavigationController() {
        let attributes = [NSAttributedString.Key.font: Constants.Fonts.titleNavBarFont ?? .systemFont(ofSize: 50)]
        UINavigationBar.appearance().titleTextAttributes = attributes
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
                                         identifireButton)
        
        textFieldStackView.addArrangedSubviews(nameTextField,
                                               emailTextField,
                                               passwordTextField,
                                               retypePasswordTextField, forgotPasswordButton)
        
        middleStackView.addArrangedSubviews(infoWithLinksLabel,
                                            authStackView,
                                            authButtonStackView)
        
        authStackView.addArrangedSubviews(leadingLineView,
                                          authLabel,
                                          trailingLineView)
        
        authButtonStackView.addArrangedSubviews(appleButton,
                                                googleButton)
        
        bottomStackView.addArrangedSubviews(infoBottomLabel,
                                            loginButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: Constants.Sizes.textFieldHeight),
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.Sizes.textFieldHeight),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.Sizes.textFieldHeight),
            retypePasswordTextField.heightAnchor.constraint(equalToConstant: Constants.Sizes.textFieldHeight),
            identifireButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight),
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
                                                 constant: Constants.Constraints.commonStackViewTopOffset),
            
            bottomStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                    constant: -Constants.Constraints.bottomOffset)
        ])
    }
}
