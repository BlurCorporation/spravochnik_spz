//
//  CalculationHeaderViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 24.02.2023.
//

import UIKit

//MARK: - CalculationHeaderViewCell

final class CalculationHeaderViewCell: UITableViewHeaderFooterView {
    
    //MARK: - Private Properties
    
    static let identifier = "CalculationHeaderViewCell"
    
    private let headerViewLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Constants.Fonts.bigTableHeaderFont
        label.numberOfLines = .zero
        return label
    }()
    
    // MARK: - Inits

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        headerViewLabel.text = text
    }
}

// MARK: - Private Methods

private extension CalculationHeaderViewCell {
    func setupViews() {
        contentView.backgroundColor = .systemBackground
        addSubViews()
        setupContsraints()
    }
    
    func addSubViews() {
        contentView.addSubviews(headerViewLabel)
    }
    
    func setupContsraints() {
        NSLayoutConstraint.activate([
            headerViewLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            headerViewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: 16),
            headerViewLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

