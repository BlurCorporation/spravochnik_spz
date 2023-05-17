//
//  CheckboxCoefficientResultTypeTableViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 13.05.2023.
//

import UIKit

// MARK: CheckboxCoefficientResultTypeTableViewCell

final class CheckboxCoefficientResultTypeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CheckboxCoefficientResultTypeTableViewCell"
    
    // MARK: - PrivateProperties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.b2
        label.numberOfLines = .zero
        return label
    }()
    
    private let xMarkImageView: UIImageView = {
        let imageView = UIImageView()
        let image = Constants.Images.xMark
        imageView.image = image
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.layer.borderWidth = Constants.Sizes.borderWidth
        stackView.layer.borderColor = Constants.Colors.grayCellColor.cgColor
        stackView.layer.cornerRadius = Constants.Sizes.savedCalcCellCornerRadius
        stackView.layoutMargins = UIEdgeInsets(top: 0,
                                               left: 16,
                                               bottom: 0,
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
    
    // MARK: - OverrideMethods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4,
                                                                     left: 16,
                                                                     bottom: 4,
                                                                     right: 16))
    }
    
    //MARK: - Methods
    
    func configure(with viewModel: CheckboxСoefficientResultViewModel) {
        titleLabel.text = viewModel.title
    }
}

// MARK: - ExtensionCheckboxCoefficientResultTypeTableViewCell

private extension CheckboxCoefficientResultTypeTableViewCell {
    func setupCell() {
        selectionStyle = .none
        contentView.addSubviews(stackView)
        
        stackView.addArrangedSubviews(titleLabel,
                                      xMarkImageView)
    }
    
    func setupContsraints() {
        let checkBoxImageViewSize: CGFloat = 10
        let stackViewHeight: CGFloat = 82
        
        NSLayoutConstraint.activate([
            xMarkImageView.heightAnchor.constraint(equalToConstant: checkBoxImageViewSize),
            xMarkImageView.widthAnchor.constraint(equalToConstant: checkBoxImageViewSize),
            stackView.heightAnchor.constraint(equalToConstant: stackViewHeight),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
