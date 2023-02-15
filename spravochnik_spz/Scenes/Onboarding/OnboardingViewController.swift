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
    
    private lazy var nextButton: CustomButton = {
        let button = CustomButton(mode: .black)
        button.setTitle(Constants.TextButtons.onboardingNextButton,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(buttonClick),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var skipButton: CustomButton = {
        let button = CustomButton(mode: .transparent)
        button.setTitle(Constants.TextButtons.onboardingSkipButton,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(closeClick),
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
    
    private lazy var labelFirst: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Constants.Fonts.onboardingFont1
        label.textColor = Constants.Colors.black
        return label
    }()
    
    private lazy var labelSecond: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = Constants.Fonts.onboardingFont2
        label.textColor = Constants.Colors.grey
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage())
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var pgControl: UIPageControl = {
        let pgControl = UIPageControl()
        pgControl.currentPageIndicatorTintColor = Constants.Colors.black
        pgControl.pageIndicatorTintColor = Constants.Colors.grey
        pgControl.preferredIndicatorImage = Constants.Images.pgLineGray
        pgControl.currentPage = 0
        pgControl.numberOfPages = 3
        pgControl.addTarget(self,
                            action: #selector(pgControlChanged),
                            for: .valueChanged)
        return pgControl
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setData()
    }
    
    @objc private func closeClick() {
        presenter?.getNextVC()
    }
    
    @objc private func pgControlChanged() {
        presenter?.changeScreen(toIndex: pgControl.currentPage)
        setData()
    }
    
    @objc private func buttonClick() {
        guard let presenter = presenter else { return }
        presenter.changeScreen(toIndex: pgControl.currentPage + 1)
        if presenter.indexForScreen < 3 {
            pgControl.currentPage = presenter.indexForScreen
        }
        setData()
    }
}

// MARK: - OnboardingViewProtocol Impl

extension OnboardingViewController: OnboardingViewProtocol {
    func setData() {
        imageView.image = presenter?.image
        labelFirst.text = presenter?.text1
        labelSecond.text = presenter?.text2
    }
}

// MARK: - PrivateMethods

private extension OnboardingViewController {
    func setupViewController() {
        view.backgroundColor = .systemBackground
        presenter?.getImage()
        presenter?.getText()
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
        buttonsStackView.addArrangedSubviews(nextButton,
                                             skipButton)
        view.addSubviews(imageView,
                         labelFirst,
                         labelSecond,
                         pgControl,
                         buttonsStackView)
    }
    
    func setupConstraints() {
        let labelButton = CGFloat(120)
        let imagesHeight = CGFloat(300)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: imagesHeight),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            labelFirst.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: Constants.Constraints.sideOffset),
            labelFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -Constants.Constraints.sideOffset),
            labelFirst.bottomAnchor.constraint(equalTo: labelSecond.topAnchor,
                                              constant: -Constants.Constraints.sideOffset),
            
            labelSecond.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: Constants.Constraints.sideOffset),
            labelSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -Constants.Constraints.sideOffset),
            labelSecond.topAnchor.constraint(equalTo: pgControl.topAnchor,
                                              constant: -labelButton),
            
            pgControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pgControl.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor,
                                              constant: -Constants.Constraints.sideOffset),
            
            nextButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
            skipButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: Constants.Constraints.sideOffset),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                       constant: -Constants.Constraints.sideOffset),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                     constant: -Constants.Constraints.sideOffset)
        ])
    }
}
