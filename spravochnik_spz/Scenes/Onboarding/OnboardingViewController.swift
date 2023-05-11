//
//  OnboardingView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.03.2023.
//

import UIKit

protocol OnboardingViewProtocol: UIViewController {
    func setData(onboardingData: [OnboardingViewModelProtocol])
    func scrollToNextScreen(indexPath: IndexPath)
}

class OnboardingViewController: UIViewController {
    
    // MARK: - Subviews
    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.itemSize = .init(width: UIScreen.main.bounds.width,
                                          height: UIScreen.main.bounds.height)
        collectionLayout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: collectionLayout)
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.contentInsetAdjustmentBehavior = .never
        collection.register(OnboardingCollectionViewCell.self,
                            forCellWithReuseIdentifier: OnboardingCollectionViewCell.cellId)
        return collection
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = Constants.Colors.dark
        pageControl.pageIndicatorTintColor = Constants.Colors.darkGray
        pageControl.preferredIndicatorImage = Constants.Images.pgLineGray
        return pageControl
    }()
    
    private lazy var nextButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.mode = .black
        button.setTitle(Constants.TextButtons.onboardingNextButton,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(nextButtonAction),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var skipButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.mode = .transparent
        button.setTitle(Constants.TextButtons.onboardingSkipButton,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(skipButtonAction),
                         for: .touchUpInside)
        return button
    }()
    
    private var buttonStackView = UIStackView()
    private var commonStackView = UIStackView()
    
    // MARK: - Properties
    var presenter: OnboardingPresenterProtocol?
    
    private var onboardingData: [OnboardingViewModelProtocol] = [OnboardingViewModel]()
    
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidLoad()
    }
    
    @objc private func skipButtonAction() {
        presenter?.getNextVC()
    }
    
    @objc private func nextButtonAction() {
        currentPage += 1
        presenter?.nextScreenButtonTaped(currentPage: currentPage)
    }
}

// MARK: - OnboardingViewProtocol
extension OnboardingViewController: OnboardingViewProtocol {
    func setData(onboardingData: [OnboardingViewModelProtocol]) {
        self.onboardingData = onboardingData
        pageControl.numberOfPages = self.onboardingData.count
        collectionView.reloadData()
    }
    
    func scrollToNextScreen(indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath,
                                    at: .right,
                                    animated: true)
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return onboardingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.cellId,
                                                            for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        let model = onboardingData[indexPath.row]
        cell.configure(model: model)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension OnboardingViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}

// MARK: - Private extension
private extension OnboardingViewController {
    func setupUI() {
        setupStackViews()
        setupViews()
        setupConstraints()
    }
    
    func setupStackViews() {
        buttonStackView = .init(arrangedSubviews: [nextButton,
                                                   skipButton],
                                axis: .vertical,
                                spacing: Constants.Constraints.sideOffset)
        commonStackView = .init(arrangedSubviews: [pageControl,
                                                   buttonStackView],
                                axis: .vertical,
                                spacing: Constants.Constraints.sideOffset)
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubviews(collectionView,
                         commonStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight),
            commonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                     constant: Constants.Constraints.sideOffset),
            commonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                      constant: -Constants.Constraints.sideOffset),
            commonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                    constant: -Constants.Constraints.sideOffset)
        ])
    }
}
