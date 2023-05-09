//
//  OnboardingView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.03.2023.
//

import UIKit

protocol OnboardingViewProtocol: UIViewController {
    func setData(onboardingData: [OnboardingModel])
    func scrollToNextScreen(indexPath: IndexPath)
}

class OnboardingView: UIViewController {
    
    // MARK: - Subvies
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
        collection.register(CarouselCell.self,
                            forCellWithReuseIdentifier: CarouselCell.cellId)
        return collection
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = Constants.Colors.black
        pageControl.pageIndicatorTintColor = Constants.Colors.grey
        pageControl.preferredIndicatorImage = Constants.Images.pgLineGray
        return pageControl
    }()
    
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
    
    // MARK: - Properties
    var presenter: OnboardingPresenterProtocol?
    
    private var onboardingData = [OnboardingModel]()
    
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
        presenter?.setData()
    }
    
    @objc private func closeClick() {
        presenter?.getNextVC()
    }
    
    @objc private func buttonClick() {
        currentPage += 1
        presenter?.nextScreenButtonTaped(currentPage: currentPage)
    }
}

// MARK: - CarouselViewDelegate
extension OnboardingView: OnboardingViewProtocol {
    func setData(onboardingData: [OnboardingModel]) {
        self.onboardingData = onboardingData
        pageControl.numberOfPages = self.onboardingData.count
        collectionView.reloadData()
    }
    
    func scrollToNextScreen(indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension OnboardingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.cellId,
                                                            for: indexPath) as? CarouselCell else { return UICollectionViewCell() }
        let model = onboardingData[indexPath.row]
        cell.configure(model: model)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension OnboardingView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}

// MARK: - Private
private extension OnboardingView {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubviews(collectionView,
                         pageControl,
                         nextButton,
                         skipButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
            
            nextButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor,
                                            constant: Constants.Constraints.sideOffset),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: Constants.Constraints.sideOffset),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -Constants.Constraints.sideOffset),
            nextButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
            
            skipButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor,
                                            constant: Constants.Constraints.sideOffset),
            skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                               constant: -Constants.Constraints.sideOffset),
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: Constants.Constraints.sideOffset),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -Constants.Constraints.sideOffset),
            skipButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
        ])
    }
}
