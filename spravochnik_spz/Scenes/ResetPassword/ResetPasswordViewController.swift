//
//  ResetPasswordViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - ResetPasswordViewProtocol

protocol ResetPasswordViewProtocol: UIViewController {
    func setupResetPassword()
    func setupUpdatePassword()
    func setupUpdateData()
}

// MARK: - ResetPasswordViewController

final class ResetPasswordViewController: UIViewController {
    var presenter: ResetPasswordPresenterProtocol?
    
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
    
    private let infoPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TextLabels.infoPasswordLabelText
        label.font = Constants.Fonts.infoPasswordFont
        label.textColor = Constants.Colors.darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let topTextField: CustomTextField = {
        let textField = CustomTextField()
        return textField
    }()
    
    private let bottomTextField: CustomTextField = {
        let textField = CustomTextField()
        return textField
    }()
    
    private let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        return stackView
    }()
    
    private let infoEmailLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TextLabels.infoEmailLabelText
        label.font = Constants.Fonts.infoPasswordFont
        label.textColor = Constants.Colors.darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var topButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.mode = .white
        button.addTarget(self,
                         action: #selector(topButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var bottomButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.mode = .black
        button.addTarget(self,
                         action: #selector(bottomButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let commonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 24
        stackView.axis = .vertical
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
    
    @objc private func bottomButtonPressed() {
        presenter?.bottomButtonPressed()
    }
    
    @objc private func topButtonPressed() {
        presenter?.topButtonPressed()
    }
}

// MARK: - ResetPasswordViewProtocol Impl

extension ResetPasswordViewController: ResetPasswordViewProtocol {
    func setupResetPassword() {
        title = Constants.NavigationController.registerTitle
        infoPasswordLabel.isHidden = true
        topTextField.placeholder = Constants.PlaceHolders.eMail
        bottomTextField.isHidden = true
        bottomButton.setTitle(Constants.TextButtons.resetPasswordButtonText,
                              for: .normal)
        topButton.isHidden = true
    }
    
    func setupUpdatePassword() {
        title = Constants.NavigationController.updatePasswordTitle
        topTextField.placeholder = Constants.PlaceHolders.newPassword
        bottomTextField.placeholder = Constants.PlaceHolders.retypePassword
        infoEmailLabel.isHidden = true
        topButton.isHidden = true
        bottomButton.setTitle(Constants.TextButtons.updatePasswordButtonText,
                              for: .normal)
        topTextField.isSecureTextEntry = true
        bottomTextField.isSecureTextEntry = true
    }
    
    func setupUpdateData() {
        title = Constants.NavigationController.updateDataTitle
        infoPasswordLabel.isHidden = true
        topTextField.placeholder = Constants.PlaceHolders.name
        bottomTextField.placeholder = Constants.PlaceHolders.eMail
        infoEmailLabel.isHidden = true
        topButton.setTitle(Constants.TextButtons.changePasswordButtonText,
                           for: .normal)
        bottomButton.setTitle(Constants.TextButtons.saveChangesButtonText,
                              for: .normal)
    }
}

// MARK: - PrivateMethods

private extension ResetPasswordViewController {
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
        textFieldStackView.addArrangedSubviews(topTextField,
                                               bottomTextField)
        
        buttonsStackView.addArrangedSubviews(topButton,
                                             bottomButton)
        
        commonStackView.addArrangedSubviews(infoPasswordLabel,
                                            textFieldStackView,
                                            infoEmailLabel,
                                            buttonsStackView)
        
        view.addSubviews(commonStackView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topTextField.heightAnchor.constraint(equalToConstant: Constants.Sizes.textFieldHeight),
            bottomTextField.heightAnchor.constraint(equalToConstant: Constants.Sizes.textFieldHeight),
            
            topButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight),
            bottomButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight),
            
            commonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                 constant: Constants.Constraints.commonStackViewTopOffset),
            commonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                     constant: Constants.Constraints.sideOffset),
            commonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                      constant: -Constants.Constraints.sideOffset)
        ])
    }
}
