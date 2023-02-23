//
//  CustomProfileButton.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 23.02.2023.
//

import UIKit

final class CustomProfileButtom: UIButton {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let themeLabel: UILabel = {
        let label = UILabel()
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
        return imageView
    }()
    
    private let commonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.layer.borderColor = UIColor.systemGray.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 12
        stackView.clipsToBounds = true
        stackView.distribution = .equalSpacing
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        labelStackView.addArrangedSubviews(headerLabel, themeLabel)
        commonStackView.addArrangedSubviews(labelStackView, chevronForwardImageView)
        
        addSubviews(commonStackView)
        
        NSLayoutConstraint.activate([
            commonStackView.topAnchor.constraint(equalTo: topAnchor),
            commonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            commonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            commonStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
