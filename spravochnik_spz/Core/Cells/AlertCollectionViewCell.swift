//
//  AlertCollectionViewCell.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 26.03.2023.
//

import UIKit

// MARK: - MainCollectionViewCellProtocol

protocol AlertCollectionViewCellProtocol: AnyObject {}

// MARK: - MainCollectionViewCell

final class AlertCollectionViewCell: UICollectionViewCell {
    
    public let label: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Constants.Fonts.h4
        label.textColor = .black
        label.numberOfLines = .zero
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: AlertCollectionViewCellModel? {
        didSet {
            guard let _object = viewModel else {return}
            self.label.text = _object.title
        }
    }
}


// MARK: - MainCollectionViewCellProtocol Impl

extension AlertCollectionViewCell: AlertCollectionViewCellProtocol {}


// MARK: - Private Methods

extension AlertCollectionViewCell {
    func setupCell() {
        self.layer.cornerRadius = 11
        self.layer.borderWidth = 0.7
        self.layer.borderColor = Constants.Colors.dark.cgColor
        contentView.addSubviews(label)
    }
    
    func setupConstraints() {
        let offsets: CGFloat = .zero
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: offsets),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: offsets),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                  constant: -offsets),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -offsets),
        ])
    }
}
