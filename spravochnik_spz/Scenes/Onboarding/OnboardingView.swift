//
//  OnboardingView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.03.2023.
//

import UIKit

protocol OnboardingViewProtocol2: UIViewController {
    func setData(onboardingData: [OnboardingModel])
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
        //        pageControl.addTarget(self,
        //                            action: #selector(pgControlChanged),
        //                            for: .valueChanged)
        return pageControl
    }()
    
    private let nextButton: CustomButton = {
        let button = CustomButton(mode: .black)
        button.setTitle(Constants.TextButtons.onboardingNextButton,
                        for: .normal)
        button.addTarget(self,
                         action: #selector(buttonClick),
                         for: .touchUpInside)
        return button
    }()
    
    private let skipButton: CustomButton = {
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
    
    private var carouselData = [OnboardingModel]()
    
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
        if currentPage >= carouselData.count {
            presenter?.getNextVC()
            return
        }
        let indexPath = IndexPath(row: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        collectionView.reloadData()
    }
    
    //  @objc private func pgControlChanged() {
    //    if currentPage >= carouselData.count {
    //        presenter?.getNextVC()
    //        return
    //    }
    //  }
}

// MARK: - CarouselViewDelegate
extension OnboardingView: OnboardingViewProtocol2 {
    func setData(onboardingData: [OnboardingModel]) {
        self.carouselData = onboardingData
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension OnboardingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = carouselData.count
        pageControl.isHidden = !(carouselData.count > 1)
        return carouselData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.cellId,
                                                            for: indexPath) as? CarouselCell else { return UICollectionViewCell() }
        let model = carouselData[indexPath.row]
        cell.configure(model: model)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension OnboardingView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left * 2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        roundedIndex.isNaN ? (currentPage = 0) : (currentPage = Int(roundedIndex))
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
            pageControl.widthAnchor.constraint(equalToConstant: 300),
            pageControl.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
            
            nextButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: Constants.Constraints.sideOffset),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraints.sideOffset),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraints.sideOffset),
            nextButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
            
            skipButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor,constant: Constants.Constraints.sideOffset),
            skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.Constraints.sideOffset),
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraints.sideOffset),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraints.sideOffset),
            skipButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
        ])
    }
}
