//
//  OnboardingView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.03.2023.
//

import UIKit

class OnboardingView: UIViewController {
    // MARK: - Subvies
    
    private var carouselView: CarouselView?
    
    // MARK: - Properties
    private var presenter: OnboardingPresenterProtocol?
    private var carouselData = [CarouselView.CarouselData]()
    
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
        guard let carouselView = carouselView else { return }
        view.addSubviews(carouselView)
        carouselView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        carouselView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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

