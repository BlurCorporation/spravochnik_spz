//
//  StartViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - StartViewProtocol

protocol StartViewProtocol: UIViewController {}

// MARK: - StartViewController

final class StartViewController: UIViewController {
    var presenter: StartPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: Constants.Images.logo)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let applicationNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.TextLabels.applicationNameLabelText
        label.font = UIFont.boldSystemFont(ofSize: Constants.Sizes.applicationNameLabelFont)
        return label
    }()
    
    private let infoApplicationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.TextLabels.infoApplicationLabelText
        label.font = UIFont.systemFont(ofSize: Constants.Sizes.infoLabelFont)
        label.textColor = Constants.Colors.grey
        label.numberOfLines = 0
        return label
    }()
    
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.Constraints.labelsStackViewSpasing
        return stackView
    }()
    
    private lazy var loginButton: CustomButton = {
        let button = CustomButton(mode: .white)
        button.setTitle(Constants.TextButtons.loginButton, for: .normal)
        button.addTarget(self,
                         action: #selector(loginButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: CustomButton = {
        let button = CustomButton(mode: .black)
        button.setTitle(Constants.TextButtons.registerButton, for: .normal)
        button.addTarget(self,
                         action: #selector(registerButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.Constraints.buttonsSpasing
        stackView.distribution = .fillEqually
        return stackView
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
    
    private let commonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    // MARK: - Action

    @objc private func loginButtonPressed() {
        loginButton.pushAnimate { [weak self] in
            self?.presenter?.loginButtonPressed()
        }
    }

    @objc private func registerButtonPressed() {
        registerButton.pushAnimate { [weak self] in
            self?.presenter?.registerButtonPressed()
        }
    }
}

// MARK: - StartViewProtocol Impl

extension StartViewController: StartViewProtocol {}

// MARK: - PrivateMethods

private extension StartViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        view.backgroundColor = .systemBackground
    }
    
    func addSubViews() {
        view.addSubviews(infoWithLinksLabel,
                         commonStackView)
        
        buttonsStackView.addArrangedSubviews(loginButton,
                                             registerButton)
        
        labelsStackView.addArrangedSubviews(applicationNameLabel,
                                            infoApplicationLabel)

        commonStackView.addArrangedSubviews(logoImageView,
                                            labelsStackView,
                                            buttonsStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            infoWithLinksLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                        constant: Constants.Constraints.sideOffset),
            infoWithLinksLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                         constant: -Constants.Constraints.sideOffset),
            infoWithLinksLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                       constant: -Constants.Constraints.lowerOffset),
            
            loginButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
            registerButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
            
            commonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                 constant: Constants.Constraints.commonStackViewTopOffset),
            commonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                     constant: Constants.Constraints.sideOffset),
            commonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                      constant: -Constants.Constraints.sideOffset),
            commonStackView.bottomAnchor.constraint(equalTo: infoWithLinksLabel.topAnchor,
                                                    constant: -Constants.Constraints.lowerOffset)
        ])
    }
}
