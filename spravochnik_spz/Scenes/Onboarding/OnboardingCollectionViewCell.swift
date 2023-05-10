//
//  HorizontalPageView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.03.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
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
    
    private var labelStackView = UIStackView()
    
    // MARK: - Properties
    static let cellId = "OnboardingCollectionViewCell"
    
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
private extension OnboardingCollectionViewCell {
    func setupUI() {
        backgroundColor = .clear
        labelStackView = .init(arrangedSubviews: [titleLabel,
                                                  textLabel],
                               axis: .vertical,
                               spacing: Constants.Constraints.sideOffset)
        addSubviews(imageView,
                    labelStackView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor,
                                              multiplier: 250/375),
            
            labelStackView.topAnchor.constraint(equalTo: centerYAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: Constants.Constraints.lowerOffset),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: -Constants.Constraints.lowerOffset)
        ])
    }
}

// MARK: - Public
extension OnboardingCollectionViewCell {
    public func configure(model: OnboardingViewModelProtocol) {
        imageView.image = model.image
        titleLabel.text = model.title
        textLabel.text = model.text
    }
}
