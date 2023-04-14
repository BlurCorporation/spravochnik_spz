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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Constants.Fonts.onboardingFont1
        label.textColor = Constants.Colors.black
        return label
    }()
    
    private lazy var textLabel: UILabel = {
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
    
    let scrollView = UIScrollView()
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        setupViewController()
        setData()
    }
    
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
        makeASlider()
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
        scrollView.setContentOffset(CGPoint(x: Int(view.frame.size.width) * pgControl.currentPage, y: 0), animated: true)
        setData()
    }
}

// MARK: - OnboardingViewProtocol Impl

extension OnboardingViewController: OnboardingViewProtocol {
    func setData() {
        imageView.image = presenter?.image
        titleLabel.text = presenter?.text1
        textLabel.text = presenter?.text2
        nextButton.setTitle(presenter?.textNextButton, for: .normal)
        //тут надо покрутить, как скрыть кнопку "Продолжить" бескостыльно
        
        print("setData")
    }
}

// MARK: - PrivateMethods

extension OnboardingViewController: UIScrollViewDelegate {
    func makeASlider() {
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        for index in 0..<3 {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            presenter?.changeScreen(toIndex: index)
            self.setData()
            
            let slide = UIView(frame: frame)
            slide.addSubview(imageView)
            slide.addSubview(titleLabel)
            slide.addSubview(textLabel)
            scrollView.addSubview(slide)
        }
        
        scrollView.contentSize = CGSize(width: scrollWidth * 3, height: scrollHeight)
        print("makeASlider")
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        pgControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x / scrollView.frame.size.width)))
//    }
    
    func setupViewController() {
        view.backgroundColor = .systemBackground
        presenter?.getImage()
        presenter?.getText()
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize.height = 1.0
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
//        makeASlider()
        buttonsStackView.addArrangedSubviews(nextButton,
                                             skipButton)
//        view.addSubviews(imageView,
//                         titleLabel,
//                         textLabel,
//                         pgControl,
//                         buttonsStackView)
        
        view.addSubviews(scrollView,
                         pgControl,
                         buttonsStackView)
    }
    
    func setupConstraints() {
//        let labelButton = CGFloat(120)
        let imagesHeight = CGFloat(300)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: imagesHeight),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width),
//
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
//                                                 constant: Constants.Constraints.sideOffset),
//            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
//                                                 constant: -Constants.Constraints.sideOffset),
//            titleLabel.bottomAnchor.constraint(equalTo: textLabel.topAnchor,
//                                              constant: -Constants.Constraints.sideOffset),
//
//            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
//                                                 constant: Constants.Constraints.sideOffset),
//            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
//                                                 constant: -Constants.Constraints.sideOffset),
//            textLabel.topAnchor.constraint(equalTo: pgControl.topAnchor,
//                                              constant: -labelButton),
//
            pgControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pgControl.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor,
                                              constant: -Constants.Constraints.sideOffset),

//            nextButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
//            skipButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
//
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: Constants.Constraints.sideOffset),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                       constant: -Constants.Constraints.sideOffset),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                     constant: -Constants.Constraints.sideOffset)
        ])
    }
}
