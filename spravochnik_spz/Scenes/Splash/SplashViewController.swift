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
        let imageView = UIImageView(image: Constants.Images.logo)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func lineView (color: UIColor) -> UIView {
        let view = UILabel()
        view.backgroundColor = color
        view.layer.masksToBounds = true
        view.layer.cornerRadius = Constants.Sizes.cornerRadiusAllLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    private lazy var gray1LineView  = lineView(color: Constants.Colors.lightGrey)
    private lazy var black2LineView  = lineView(color: Constants.Colors.black)
    private lazy var gray3LineView = lineView(color: Constants.Colors.lightGrey)
    
    private var linesStackView = UIStackView()
        
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
        linesStackView = UIStackView(arrangedSubviews: [gray1LineView,
                                                        black2LineView,
                                                        gray3LineView],
                                     axis: .horizontal,
                                     spacing: Constants.Sizes.spasingBetweenLine)
        
        view.addSubview(logoImageView)
        view.addSubview(linesStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gray1LineView.heightAnchor.constraint(equalToConstant: Constants.Sizes.heightAllLine),
            gray1LineView.widthAnchor.constraint(equalToConstant: Constants.Sizes.widthGrayLine),
            
            black2LineView.heightAnchor.constraint(equalToConstant: Constants.Sizes.heightAllLine),
            black2LineView.widthAnchor.constraint(equalToConstant: Constants.Sizes.widthBlackLine),
            
            gray3LineView.heightAnchor.constraint(equalToConstant: Constants.Sizes.heightAllLine),
            gray3LineView.widthAnchor.constraint(equalToConstant: Constants.Sizes.widthGrayLine),
            
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 151),
            logoImageView.heightAnchor.constraint(equalToConstant: 112),
            
            linesStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linesStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
        ])
    }
}
