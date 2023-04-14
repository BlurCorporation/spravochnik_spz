//
//  PageView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.03.2023.
//

import UIKit

protocol CarouselViewDelegate: AnyObject {
    func currentPageDidChange(to page: Int)
}

class CarouselView: UIView {
    var presenter: OnboardingPresenterProtocol?
    
    struct CarouselData {
        let image: UIImage?
        let title: String
        let text: String
    }
    
    // MARK: - Subviews
    private lazy var carouselCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.dataSource = self
        collection.delegate = self
        collection.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.cellId)
        collection.backgroundColor = .yellow
        collection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return collection
     }()
    
    private var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = Constants.Colors.black
        pageControl.pageIndicatorTintColor = Constants.Colors.grey
        pageControl.preferredIndicatorImage = Constants.Images.pgLineGray
//        pageControl.addTarget(self,
//                            action: #selector(pgControlChanged),
//                            for: .valueChanged)
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
    private var carouselData = [CarouselData]()
    private var pages: Int
    private weak var delegate: CarouselViewDelegate?
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            delegate?.currentPageDidChange(to: currentPage)
//            self.reloadInputViews()
        }
    }
    
    init(pages: Int, delegate: CarouselViewDelegate?) {
            self.pages = pages
            self.delegate = delegate
            super.init(frame: .zero)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
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
        print("indexPath", indexPath)
        carouselCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        carouselCollectionView.reloadData()
        
    }
}

// MARK: - UICollectionViewDataSource
extension CarouselView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.cellId, for: indexPath) as? CarouselCell else { return UICollectionViewCell() }
        let image = carouselData[indexPath.row].image
        let title = carouselData[indexPath.row].title
        let text = carouselData[indexPath.row].text
        cell.configure(image: image, title: title, text: text)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - Public
extension CarouselView {
    public func configureView(with data: [CarouselData]) {
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        carouselLayout.itemSize = .init(width: frame.width, height: 500)
        carouselLayout.sectionInset = .zero
        
        carouselData = data
        carouselLayout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        carouselLayout.minimumInteritemSpacing = 0
        carouselLayout.minimumLineSpacing = 0
        print("carouselLayout ", carouselLayout.itemSize, "carouselCollectionView ", carouselCollectionView.frame.size)
        carouselCollectionView.collectionViewLayout = carouselLayout
        carouselCollectionView.reloadData()
    }
}

private extension CarouselView {
    func getCurrentPage() -> Int {
        let visibleRect = CGRect(origin: carouselCollectionView.contentOffset, size: carouselCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.minX, y: visibleRect.minY)
        if let visibleIndexPath = carouselCollectionView.indexPathForItem(at: visiblePoint) {
            return visibleIndexPath.row
        }
        return currentPage
    }
}

extension CarouselView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
}

private extension CarouselView {
    func setupUI() {
        backgroundColor = .clear
        setupCollectionView()
        setupPageControl()
        setupButtons()
    }
    
    func setupCollectionView() {
        addSubviews(carouselCollectionView)
        carouselCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        carouselCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        carouselCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        carouselCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        carouselCollectionView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    func setupPageControl() {
        addSubviews(pageControl)
        pageControl.topAnchor.constraint(equalTo: bottomAnchor, constant: -200).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pageControl.numberOfPages = pages
    }
    
    func setupButtons() {
        addSubviews(nextButton, skipButton)
        skipButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Constraints.sideOffset).isActive = true
        skipButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Constraints.sideOffset).isActive = true
        skipButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Constraints.sideOffset).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight).isActive = true
        
        nextButton.bottomAnchor.constraint(equalTo: skipButton.topAnchor,
                                           constant: -Constants.Constraints.sideOffset).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Constraints.sideOffset).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Constraints.sideOffset).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight).isActive = true
    }
}
