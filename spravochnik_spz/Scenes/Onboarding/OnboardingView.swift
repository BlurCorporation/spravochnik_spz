//
//  OnboardingView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.03.2023.
//

import UIKit

class OnboardingView: UIViewController {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.cellId, for: indexPath) as? CarouselCell else {
//            return UICollectionViewCell()
//
//        }
//        return cell
//    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
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
    
    // MARK: - Subvies
    
    private var carouselView: CarouselView?
    
    // MARK: - Properties
    private var presenter: OnboardingPresenterProtocol?
    private var carouselData = [CarouselView.CarouselData]()
    
//    private lazy var collectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.backgroundColor = .clear
//        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.cellId)
//        return collectionView
//    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        carouselView = CarouselView(pages: 3, delegate: self)
        setCarouselData()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carouselView?.configureView(with: carouselData)
    }
    
    private func setCarouselData() {
        carouselData.append(.init(image: Constants.Images.onboarding1,
                                  title: Constants.TextLabels.onboarding11,
                                  text: Constants.TextLabels.onboarding12))
        carouselData.append(.init(image: Constants.Images.onboarding2,
                                  title: Constants.TextLabels.onboarding21,
                                  text: Constants.TextLabels.onboarding22))
        carouselData.append(.init(image: Constants.Images.onboarding3,
                                  title: Constants.TextLabels.onboarding31,
                                  text: Constants.TextLabels.onboarding32))
    }
}

// MARK: - Setups
private extension OnboardingView {
    func setupUI() {
        view.backgroundColor = .systemBackground
//        view.addSubviews(collectionView)
        guard let carouselView = carouselView else { return }
        view.addSubviews(carouselView)
        carouselView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        carouselView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
    }
}

// MARK: - CarouselViewDelegate
extension OnboardingView: CarouselViewDelegate {
    func currentPageDidChange(to page: Int) {
        UIView.animate(withDuration: 0.7) {
//            self.view.backgroundColor = self.backgroundColors[page]
        }
    }
}

