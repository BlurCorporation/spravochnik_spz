//
//  NoInternetView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 15.04.2023.
//

import UIKit

class NoInternetView: UIView {
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.Images.noInternet
        return imageView
    }()
    
    private let noInternetTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TextLabels.noInternetTitle
        label.font = Constants.Fonts.h5
        label.textAlignment = .center
        label.tintColor = Constants.Colors.dark
        return label
    }()
    
    private let noInternetTextLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TextLabels.noInternetText
        label.font = Constants.Fonts.b3
        label.numberOfLines = 0
        label.textAlignment = .center
        label.tintColor = Constants.Colors.darkGray
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = Constants.Sizes.spasingBetweenLine
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NoInternetView {
    func setupView() {
        addSubViews()
        setupConstraints()
        self.backgroundColor = .systemBackground
    }
    
    func addSubViews() {
        self.addSubviews(stackView)
        self.addSubviews(image)
        stackView.addArrangedSubviews(noInternetTitleLabel,
                                      noInternetTextLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: Constants.Constraints.capImageSize),
            image.widthAnchor.constraint(equalToConstant: Constants.Constraints.capImageSize),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -Constants.Constraints.sideOffset),
            
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: self.centerYAnchor, constant: Constants.Constraints.sideOffset),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.Constraints.sideOffset),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.Constraints.sideOffset)
        ])
    }
}

// Метод для отображения на контроллерах
//func setupNoInternetView() {
//    let noInternetView = NoInternetView()
//    view.addSubviews(noInternetView)
//    NSLayoutConstraint.activate([
//        noInternetView.topAnchor.constraint(equalTo: view.topAnchor),
//        noInternetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        noInternetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        noInternetView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//    ])
//}

