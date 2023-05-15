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
                                    title: Constants.TextLabels.onboarding11,
                                    text: Constants.TextLabels.onboarding12),
                OnboardingViewModel(image: Constants.Images.onboarding2,
                                    title: Constants.TextLabels.onboarding21,
                                    text: Constants.TextLabels.onboarding22),
                OnboardingViewModel(image: Constants.Images.onboarding3,
                                    title: Constants.TextLabels.onboarding31,
                                    text: Constants.TextLabels.onboarding32)]
    }
}
