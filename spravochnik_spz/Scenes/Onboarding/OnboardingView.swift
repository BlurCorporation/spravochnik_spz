//
//  OnboardingView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.03.2023.
//

import UIKit

protocol OnboardingViewProtocol2: UIViewController {
    func setData(carouselData: [CarouselView.CarouselData])
}

class OnboardingView: UIViewController {
    
    // MARK: - Subvies
    private var carouselView: CarouselView?
    
    // MARK: - Properties
    var presenter: OnboardingPresenterProtocol?
    private var carouselData = [CarouselView.CarouselData]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        carouselView = CarouselView(presenter: self.presenter)
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carouselView?.configureView(with: carouselData)
    }
}

// MARK: - Setups
private extension OnboardingView {
    func setupUI() {
        view.backgroundColor = .systemBackground
        guard let carouselView = carouselView else { return }
        view.addSubviews(carouselView)
        NSLayoutConstraint.activate([
            carouselView.topAnchor.constraint(equalTo: view.topAnchor),
            carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carouselView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - CarouselViewDelegate
extension OnboardingView: OnboardingViewProtocol2 {
    func setData(carouselData: [CarouselView.CarouselData]) {
        self.carouselData = carouselData
    }
}
