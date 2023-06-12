//
//  ChoiceCoefficientResultTypeTableViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 13.05.2023.
//

import UIKit

// MARK: ChoiceCoefficientResultTypeTableViewCell

final class ChoiceCoefficientResultTypeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ChoiceCoefficientResultTypeTableViewCell"
    
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
    
    func configure(with viewModel: ChoiceCoefficientResultViewModel) {
        titleLabel.text = viewModel.title
    }
}

// MARK: - ExtensionChoiceCoefficientResultTypeTableViewCell

private extension ChoiceCoefficientResultTypeTableViewCell {
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
