//
//  CustomProfileView.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 17.02.2023.
//

import UIKit

class CustomProfileView: UIView {
    init(firstTitle: String, secondTitle: String?) {
        super.init(frame: CGRect.zero)
        firstLabel.text = firstTitle
        secondLabel.text = secondTitle
        addSubViews()
        setupConstraints()
        self.isUserInteractionEnabled = false
        self.isExclusiveTouch = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.profileButtonFont
        label.textColor = UIColor(red: 14/255,
                                  green: 19/255,
                                  blue: 25/255,
                                  alpha: 1)
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.profileButtonFont
        label.textColor = UIColor(red: 207/255,
                                  green: 208/255,
                                  blue: 209/255,
                                  alpha: 1)
        return label
    }()
    
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let chevronForwardImageView: UIImageView = {
        let image = UIImage(systemName: "chevron.forward")
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = UIColor(red: 0.525,
                                      green: 0.537,
                                      blue: 0.545,
                                      alpha: 1)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let labelsImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
}

extension CustomProfileView {
    private func addSubViews() {
        if secondLabel.text != nil {
            labelsStackView.addArrangedSubviews(firstLabel,
                                                secondLabel)
        } else {
            labelsStackView.addArrangedSubviews(firstLabel)
        }
        labelsImageStackView.addArrangedSubviews(labelsStackView, chevronForwardImageView)
        self.addSubviews(labelsImageStackView)
    }
    
    private func setupConstraints() {
        let offset = CGFloat(16)
        
        NSLayoutConstraint.activate([
            labelsImageStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: offset),
            labelsImageStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -offset),
            labelsImageStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offset),
            labelsImageStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -offset),
        ])
    }
}
