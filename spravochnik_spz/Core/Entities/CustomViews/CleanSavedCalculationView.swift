//
//  SavedCalculationView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 15.04.2023.
//

import UIKit

class CleanSavedCalculationView: UIView {
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.Images.file
        return imageView
    }()
    
    private let savedCalcTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TextLabels.savedCalcTitle
        label.font = Constants.Fonts.h5
        label.numberOfLines = 0
        label.textAlignment = .center
        label.tintColor = Constants.Colors.dark
        return label
    }()
    
    private let savedCalcTextLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TextLabels.savedCalcText
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

extension CleanSavedCalculationView {
    func setupView() {
        addSubViews()
        setupConstraints()
        self.backgroundColor = .systemBackground
    }
    
    func addSubViews() {
        self.addSubviews(stackView)
        self.addSubviews(image)
        stackView.addArrangedSubviews(savedCalcTitleLabel,
                                      savedCalcTextLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: Constants.Constraints.capImageSize),
            image.widthAnchor.constraint(equalToConstant: Constants.Constraints.capImageSize),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.bottomAnchor.constraint(equalTo: self.centerYAnchor,
                                          constant: -Constants.Constraints.sideOffset),
            
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: self.centerYAnchor,
                                           constant: Constants.Constraints.sideOffset),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                               constant: Constants.Constraints.sideOffset),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                constant: -Constants.Constraints.sideOffset)
        ])
    }
}

// Метод для отображения на контроллерах
//func setupCleanSavedCalculationView() {
//    let cleanView = CleanSavedCalculationView()
//    view.addSubviews(cleanView)
//    NSLayoutConstraint.activate([
//        cleanView.topAnchor.constraint(equalTo: view.topAnchor),
//        cleanView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        cleanView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        cleanView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//    ])
//}
