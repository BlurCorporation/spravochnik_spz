//
//  MainCollectionViewCell.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 25.02.2023.
//

import UIKit

// MARK: - MainCollectionViewCellProtocol

protocol MainCollectionViewCellProtocol: AnyObject {
    func set(object: MainCollectionViewModel)
}

// MARK: - MainCollectionViewCell

final class MainCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Constants.Fonts.h4
        label.textColor = .white
        label.numberOfLines = .zero
        return label
    }()
    
    private let typeImage: UIImageView = {
        let image = Constants.Images.stage
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    private let commonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - MainCollectionViewCellProtocol Impl

extension MainCollectionViewCell: MainCollectionViewCellProtocol {
    func set(object: MainCollectionViewModel) {
        self.backgroundColor = object.backgroundColor
        self.titleLabel.text = object.title
        self.typeImage.image = object.typeImage
    }
}

// MARK: - Private Methods

extension MainCollectionViewCell {
    func setupCell() {
        self.layer.cornerRadius = 24
        commonStack.addArrangedSubviews(typeImage,
                                        titleLabel)
        
        contentView.addSubviews(commonStack)
    }
    
    func setupConstraints() {
        let offsets = CGFloat(20)
        
        NSLayoutConstraint.activate([
            commonStack.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: offsets),
            commonStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: offsets),
            commonStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                  constant: -offsets)
        ])
    }
}
