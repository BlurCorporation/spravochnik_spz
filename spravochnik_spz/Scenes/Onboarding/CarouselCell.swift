//
//  HorizontalPageView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.03.2023.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    
    // MARK: - SubViews
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Constants.Fonts.onboardingFont1
        label.textAlignment = .center
        return label
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Constants.Fonts.onboardingFont2
        label.textColor = Constants.Colors.lightGrey
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Properties
    static let cellId = "CarouselCell"
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setups
private extension CarouselCell {
    func setupUI() {
        backgroundColor = .clear
        addSubviews(imageView,
                    titleLabel,
                    textLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor,
                                              multiplier: 250/375),
            
            titleLabel.topAnchor.constraint(equalTo: centerYAnchor,
                                            constant: Constants.Constraints.lowerOffset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: Constants.Constraints.lowerOffset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -Constants.Constraints.lowerOffset),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                           constant: Constants.Constraints.sideOffset),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: Constants.Constraints.lowerOffset),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: -Constants.Constraints.lowerOffset)
        ])
    }
}

// MARK: - Public
extension CarouselCell {
    public func configure(model: OnboardingModel) {
        imageView.image = model.image
        titleLabel.text = model.title
        textLabel.text = model.text
    }
}
