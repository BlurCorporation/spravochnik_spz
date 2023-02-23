//
//  SplashViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: - SplashViewProtocol

protocol SplashViewProtocol: UIViewController {}

// MARK: - SplashViewController

final class SplashViewController: UIViewController {
    var presenter: SplashPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: Constants.Images.logoImage)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var gray1LineView = lineView(color: Constants.Colors.lightGrey)
    private lazy var black2LineView  = lineView(color: Constants.Colors.dark)
    private lazy var gray3LineView = lineView(color: Constants.Colors.lightGrey)
    
    private lazy var linesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Constants.Sizes.spasingBetweenLine
        return stackView
    }()
        
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: - SplashViewProtocol Impl

extension SplashViewController: SplashViewProtocol {}

// MARK: - PrivateMethods

private extension SplashViewController {
    func setupViewController() {
        view.backgroundColor = Constants.Colors.lightThemeBackground
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
        linesStackView.addArrangedSubviews(gray1LineView,
                                           black2LineView,
                                           gray3LineView)
        view.addSubviews(logoImageView,
                         linesStackView)
    }
    
    func setupConstraints() {
        let logoWidth: CGFloat = 151
        let logoHeight: CGFloat = 112
        let linesBottomAnchor: CGFloat = -150
        
        NSLayoutConstraint.activate([
            gray1LineView.heightAnchor.constraint(equalToConstant: Constants.Sizes.heightAllLine),
            gray1LineView.widthAnchor.constraint(equalToConstant: Constants.Sizes.widthGrayLine),
            
            black2LineView.heightAnchor.constraint(equalToConstant: Constants.Sizes.heightAllLine),
            black2LineView.widthAnchor.constraint(equalToConstant: Constants.Sizes.widthBlackLine),
            
            gray3LineView.heightAnchor.constraint(equalToConstant: Constants.Sizes.heightAllLine),
            gray3LineView.widthAnchor.constraint(equalToConstant: Constants.Sizes.widthGrayLine),
            
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: logoWidth),
            logoImageView.heightAnchor.constraint(equalToConstant: logoHeight),
            
            linesStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linesStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: linesBottomAnchor)
        ])
    }
}
