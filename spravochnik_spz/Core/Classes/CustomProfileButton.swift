//
//  CustomProfileButton.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 23.02.2023.
//

import UIKit

enum typeSize {
    case small
    case big
}

final class CustomProfileButton: UIButton {
    
    private var buttonSize: CGFloat?
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.profileButtonFont
        label.textColor = Constants.Colors.dark
        return label
    }()
    
    private let themeLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.profileButtonFont
        label.textColor = Constants.Colors.lightGray
        return label
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let chevronForwardImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "chevron.forward")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Constants.Colors.darkGray
        return imageView
    }()
    
    private let commonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.layer.borderColor = UIColor.systemGray.cgColor
        stackView.layer.borderWidth = Constants.Sizes.borderWidth
        stackView.layer.borderColor = Constants.Colors.lightGray.cgColor
        stackView.layer.cornerRadius = 11
        stackView.clipsToBounds = true
        stackView.distribution = .equalSpacing
        stackView.layoutMargins = UIEdgeInsets(top: 16,
                                               left: 16,
                                               bottom: 16,
                                               right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .center
        return stackView
    }()
    
    init(size: typeSize) {
        super.init(frame: CGRect.zero)
        switch size {
        case .big:
            buttonSize = 69
        default:
            buttonSize = 50
        }
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitleLabels(header: String, theme: String? = nil) {
        headerLabel.text = header
        themeLabel.text = theme
    }
    
    private func setupButton() {
        labelStackView.addArrangedSubviews(headerLabel,
                                           themeLabel)
        commonStackView.addArrangedSubviews(labelStackView,
                                            chevronForwardImageView)
        addSubviews(commonStackView)
        
        NSLayoutConstraint.activate([
            commonStackView.topAnchor.constraint(equalTo: topAnchor),
            commonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            commonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            commonStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            commonStackView.heightAnchor.constraint(equalToConstant: buttonSize ?? 20),
        ])
    }
}
