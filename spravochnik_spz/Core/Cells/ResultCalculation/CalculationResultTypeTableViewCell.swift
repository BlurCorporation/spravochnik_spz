//
//  CalculationResultTypeTableViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 14.05.2023.
//

import UIKit

// MARK: CalculationResultTypeTableViewCell

final class CalculationResultTypeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CalculationResultTypeTableViewCell"
    
    // MARK: - PrivateProperties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.h5
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.b2
        return label
    }()
    
    private let carrencyWithoutVatLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.b2
        return label
    }()
    
    private let costWithoutVatLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.h5
        return label
    }()
    
    private let costWithoutVatStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        return stackView
    }()
    
    private let priceWithoutVatLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.b2
        return label
    }()
    
    private let commonWithoutVatStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let carrencyWithVatLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.b2
        return label
    }()
    
    private let costWithVatLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.h5
        return label
    }()
    
    private let costWithVatStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        return stackView
    }()
    
    private let priceWithVatLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.b2
        return label
    }()
    
    private let commonWithVatStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let commonCostStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let commonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        stackView.spacing = 16
        stackView.alignment = .leading
        stackView.layer.borderWidth = Constants.Sizes.borderWidth
        stackView.layer.borderColor = Constants.Colors.grayCellColor.cgColor
        stackView.layer.cornerRadius = Constants.Sizes.savedCalcCellCornerRadius
        stackView.layoutMargins = UIEdgeInsets(top: 24,
                                               left: 16,
                                               bottom: 24,
                                               right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
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
    
    func configure(with viewModel: CalculationResultViewModel) {
        print(viewModel)
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        carrencyWithoutVatLabel.text = viewModel.prices[0].description
        carrencyWithVatLabel.text = viewModel.prices[1].description
        costWithVatLabel.text = viewModel.prices[0].cost
        costWithoutVatLabel.text = viewModel.prices[1].cost
        priceWithVatLabel.text = viewModel.prices[0].title
        priceWithoutVatLabel.text = viewModel.prices[1].title
//        carrencyWithoutVatLabel.text = viewModel.prices.withoutVat.description
//        carrencyWithVatLabel.text = viewModel.prices.withoutVat.description
//        costWithVatLabel.text = viewModel.prices.withoutVat.description
//        costWithoutVatLabel.text = viewModel.prices.withoutVat.description
//        priceWithVatLabel.text = viewModel.prices.withoutVat.description
//        priceWithoutVatLabel.text = viewModel.prices.withoutVat.description
    }
}

// MARK: - ExtensionCalculationResultTypeTableViewCell

private extension CalculationResultTypeTableViewCell {
    func setupCell() {
        selectionStyle = .none
        
        costWithoutVatStackView.addArrangedSubviews(costWithoutVatLabel,
                                                    carrencyWithoutVatLabel)
        
        costWithVatStackView.addArrangedSubviews(costWithVatLabel,
                                                 carrencyWithVatLabel)
        
        commonWithoutVatStackView.addArrangedSubviews(priceWithoutVatLabel,
                                                      costWithoutVatStackView)
        
        commonWithVatStackView.addArrangedSubviews(priceWithVatLabel,
                                                   costWithVatStackView)
        
        commonCostStackView.addArrangedSubviews(descriptionLabel,
                                                 commonWithoutVatStackView,
                                                 commonWithVatStackView)
        
        commonStackView.addArrangedSubviews(titleLabel,
                                            commonCostStackView)
    
        contentView.addSubviews(commonStackView)
    }
    
    func setupContsraints() {
        NSLayoutConstraint.activate([
            commonStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            commonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            commonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            commonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  16)
        ])
    }
}
