//
//  ResultCalculationHeaderViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 11.06.2023.
//

import UIKit

//MARK: - ResultCalculationHeaderViewCell

final class ResultCalculationHeaderViewCell: UITableViewHeaderFooterView {
    
    //MARK: - Private Properties
    
    static let identifier = "ResultCalculationHeaderViewCell"
    
    private let headerViewLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Constants.Fonts.h3
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
    
    func configure(with viewModel: HeaderViewModel) {
        headerViewLabel.text = viewModel.title
    }
}

// MARK: - Private Methods

private extension ResultCalculationHeaderViewCell {
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
                                                     constant: Constants.Constraints.leadingHeaderOffset)
        ])
    }
}
