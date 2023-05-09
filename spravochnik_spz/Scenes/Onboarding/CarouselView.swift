//
//  PageView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.03.2023.
//

import UIKit

//struct CarouselData {
//    let image: UIImage?
//    let title: String
//    let text: String
//}

//class CarouselView: UIView {
//    var presenter: OnboardingPresenterProtocol?
//    
////    struct CarouselData {
////        let image: UIImage?
////        let title: String
////        let text: String
////    }
//    
//    // MARK: - Subviews
//    private lazy var carouselCollectionView: UICollectionView = {
//        let carouselLayout = UICollectionViewFlowLayout()
////        carouselLayout.headerReferenceSize = .zero
//        carouselLayout.scrollDirection = .horizontal
//        carouselLayout.itemSize = .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        carouselLayout.sectionInset = .zero
//        carouselLayout.minimumLineSpacing = 0
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: carouselLayout)
//        collection.showsHorizontalScrollIndicator = false
//        collection.isPagingEnabled = true
//        collection.dataSource = self
//        collection.delegate = self
//        collection.contentInsetAdjustmentBehavior = .never
//        collection.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.cellId)
//        collection.backgroundColor = .yellow
//        collection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        return collection
//    }()
//    
//    private var pageControl: UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.currentPageIndicatorTintColor = Constants.Colors.black
//        pageControl.pageIndicatorTintColor = Constants.Colors.grey
//        pageControl.preferredIndicatorImage = Constants.Images.pgLineGray
//        //        pageControl.addTarget(self,
//        //                            action: #selector(pgControlChanged),
//        //                            for: .valueChanged)
//        return pageControl
//    }()
//    
//    private lazy var nextButton: CustomButton = {
//        let button = CustomButton(mode: .black)
//        button.setTitle(Constants.TextButtons.onboardingNextButton,
//                        for: .normal)
//        button.addTarget(self,
//                         action: #selector(buttonClick),
//                         for: .touchUpInside)
//        return button
//    }()
//    
//    private lazy var skipButton: CustomButton = {
//        let button = CustomButton(mode: .transparent)
//        button.setTitle(Constants.TextButtons.onboardingSkipButton,
//                        for: .normal)
//        button.addTarget(self,
//                         action: #selector(closeClick),
//                         for: .touchUpInside)
//        return button
//    }()
//    
//    // MARK: - Properties
//    private var carouselData = [CarouselData]()
//    private var currentPage = 0 {
//        didSet {
//            pageControl.currentPage = currentPage
//        }
//    }
//    
//    init(presenter: OnboardingPresenterProtocol?) {
//        super.init(frame: .zero)
//        self.presenter = presenter
//        setupUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @objc private func closeClick() {
//        presenter?.getNextVC()
//    }
//    
//    @objc private func buttonClick() {
//        currentPage += 1
//        if currentPage >= carouselData.count {
//            presenter?.getNextVC()
//            return
//        }
//        let indexPath = IndexPath(row: currentPage, section: 0)
//        carouselCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
//        carouselCollectionView.reloadData()
//    }
//    
//    //  @objc private func pgControlChanged() {
//    //    if currentPage >= carouselData.count {
//    //        presenter?.getNextVC()
//    //        return
//    //    }
//    //  }
//}
//
//// MARK: - UICollectionViewDataSource
//extension CarouselView: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        pageControl.numberOfPages = carouselData.count
//        pageControl.isHidden = !(carouselData.count > 1)
//        return carouselData.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.cellId, for: indexPath) as? CarouselCell else { return UICollectionViewCell() }
//        let image = carouselData[indexPath.row].image
//        let title = carouselData[indexPath.row].title
//        let text = carouselData[indexPath.row].text
//        cell.configure(image: image, title: title, text: text)
//        return cell
//    }
//
//}
//
//// MARK: - UICollectionViewDelegate
//extension CarouselView: UICollectionViewDelegate {
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let witdh = scrollView.frame.width - (scrollView.contentInset.left * 2)
//        let index = scrollView.contentOffset.x / witdh
//        let roundedIndex = round(index)
//        roundedIndex.isNaN ? (currentPage = 0) : (currentPage = Int(roundedIndex))
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let witdh = scrollView.frame.width - (scrollView.contentInset.left * 2)
//        let index = scrollView.contentOffset.x / witdh
//        let roundedIndex = round(index)
//        roundedIndex.isNaN ? (currentPage = 0) : (currentPage = Int(roundedIndex))
//    }
//}
//
//// MARK: - Public
//extension CarouselView {
//    public func configureView(with data: [CarouselData]) {
//        carouselData = data
//        carouselCollectionView.reloadData()
//    }
//}
//
//private extension CarouselView {
//    func setupUI() {
//        backgroundColor = .clear
//        setupViews()
//        setupConstraints()
//    }
//    
//    func setupViews() {
//        pageControl.numberOfPages = 3
//        addSubviews(carouselCollectionView, pageControl, nextButton, skipButton)
//    }
//    
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            carouselCollectionView.topAnchor.constraint(equalTo: topAnchor),
//            carouselCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            carouselCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            carouselCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            
//            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
//            pageControl.widthAnchor.constraint(equalToConstant: 300),
//            pageControl.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
//            
//            nextButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: Constants.Constraints.sideOffset),
//            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Constraints.sideOffset),
//            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Constraints.sideOffset),
//            nextButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
//            
//            skipButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor,constant: Constants.Constraints.sideOffset),
//            skipButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Constraints.sideOffset),
//            skipButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Constraints.sideOffset),
//            skipButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Constraints.sideOffset),
//            skipButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
//        ])
//    }
//}
