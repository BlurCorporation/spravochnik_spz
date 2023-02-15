//
//  OnboardingPresenter.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

// MARK: - OnboardingPresenterProtocol

import UIKit

protocol OnboardingPresenterProtocol: AnyObject {
    var image: UIImage? { get set }
    var text1: String? { get set }
    var text2: String? { get set }
    var indexForScreen: Int { get }
    var model: OnboardingModel1 { get }
    func getImage()
    func getText()
    func changeScreen(toIndex: Int?)
    func getNextVC()
}

// MARK: - OnboardingPresenter

class OnboardingPresenter {
    weak var viewController: OnboardingViewProtocol?
    var image: UIImage?
    var text1: String?
    var text2: String?
    var indexForScreen = 0
    
    // MARK: - PrivateProperties

    private let sceneBuildManager: Buildable
    internal var model: OnboardingModel1
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
        self.model = OnboardingModel1()
    }
}

//MARK: - OnboardingPresenterExtension

extension OnboardingPresenter: OnboardingPresenterProtocol {
    func getImage() {
        image = model.images[indexForScreen]
    }
    
    func getText() {
        text1 = model.texts1[indexForScreen]
        text2 = model.texts2[indexForScreen]
    }
    
    func changeScreen(toIndex: Int? = nil) {
        if let toIndex = toIndex {
            indexForScreen = toIndex-1
        }
        
        if indexForScreen < 2 && indexForScreen > -2 {
            indexForScreen += 1
            getImage()
            getText()
        } else {
            getNextVC()
        }
    }
    
    func getNextVC() {
        let startViewController = sceneBuildManager.buildStartScreen()
        viewController?.navigationController?.pushViewController(startViewController,
                                                                 animated: true)
    }
}
