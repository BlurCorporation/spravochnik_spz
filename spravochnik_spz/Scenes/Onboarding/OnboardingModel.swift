//
//  OnboardingModel.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 11.02.2023.
//

import UIKit

struct OnboardingModel {
    let image: UIImage
    let title: String
    let text: String
}

enum Model {
    case onbording1
    case onbording2
    case onbording3
    
    var image: UIImage {
        switch self {
        case .onbording1:
             return Constants.Images.onboarding1
        case .onbording2:
            return Constants.Images.onboarding2
        case .onbording3:
            return Constants.Images.onboarding3
        }
    }
    
    var title: String {
        switch self {
        case .onbording1:
             return Constants.TextLabels.onboarding11
        case .onbording2:
            return Constants.TextLabels.onboarding21
        case .onbording3:
            return Constants.TextLabels.onboarding31
        }
    }
    
    var text: String {
        switch self {
        case .onbording1:
             return Constants.TextLabels.onboarding12
        case .onbording2:
            return Constants.TextLabels.onboarding22
        case .onbording3:
            return Constants.TextLabels.onboarding32
        }
    }
}
