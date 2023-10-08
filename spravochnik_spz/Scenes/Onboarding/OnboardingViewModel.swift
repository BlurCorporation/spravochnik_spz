//
//  OnboardingViewModel.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 11.05.2023.
//

import UIKit

protocol OnboardingViewModelProtocol {
    var image: UIImage { get }
    var title: String { get }
    var text: String { get }
}

struct OnboardingViewModel: OnboardingViewModelProtocol {
    let image: UIImage
    let title: String
    let text: String
    
    static var makeModel: [OnboardingViewModel] {
        return [OnboardingViewModel(image: Constants.Images.onboarding1,
                                    title: "onboarding11".localized,
                                    text: "onboarding12".localized),
                OnboardingViewModel(image: Constants.Images.onboarding2,
                                    title: "onboarding21".localized,
                                    text: "onboarding22".localized),
                OnboardingViewModel(image: Constants.Images.onboarding3,
                                    title: "onboarding31".localized,
                                    text: "onboarding32".localized)]
    }
}
