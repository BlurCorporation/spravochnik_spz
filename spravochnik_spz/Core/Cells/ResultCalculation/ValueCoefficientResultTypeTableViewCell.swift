//
//  ValueCoefficientResultTypeTableViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 13.05.2023.
//

import UIKit

// MARK: ValueCoefficientResultTypeTableViewCell

final class ValueCoefficientResultTypeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ValueCoefficientResultTypeTableViewCell"
    
    // MARK: - PrivateProperties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.b1
        label.numberOfLines = .zero
        return label
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupCell()
        setupContsraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func configure(with viewModel: ValueСoefficientResultViewModel) {
        titleLabel.text = viewModel.title
    }
}

// MARK: - ExtensionValueCoefficientResultTypeTableViewCell

private extension ValueCoefficientResultTypeTableViewCell {
    func setupCell() {
        selectionStyle = .none
    
        contentView.addSubviews(titleLabel)
    }
    
    func setupContsraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
