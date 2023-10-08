//
//  CheckboxCoefficientTypeTableViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 24.02.2023.
//

import UIKit

// MARK: CheckboxCoefficientTypeTableViewCell

final class CheckboxCoefficientTypeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CheckboxCoefficientTypeTableViewCell"
    
    // MARK: - PrivateProperties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.b2
        label.numberOfLines = .zero
        return label
    }()
    
    private let checkBoxImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.layer.borderWidth = Constants.Sizes.borderWidth
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
    
    func configure(with viewModel: CheckboxСoefficientViewModel) {
        titleLabel.text = viewModel.title
        titleLabel.textColor = viewModel.isSelected
        ? Constants.Colors.dark
        : Constants.Colors.lightGray
        
        stackView.layer.borderColor = viewModel.isSelected
        ? Constants.Colors.dark.cgColor
        : Constants.Colors.lightGray.cgColor
        
        checkBoxImageView.image = viewModel.isSelected
        ? Constants.Images.checkBoxTrueImage
        : Constants.Images.checkBoxImage
    }
}

// MARK: - ExtensionCheckboxCoefficientTypeTableViewCell

private extension CheckboxCoefficientTypeTableViewCell {
    func setupCell() {
        selectionStyle = .none
        contentView.addSubviews(stackView)
        
        stackView.addArrangedSubviews(titleLabel,
                                      checkBoxImageView)
    }
    
    func setupContsraints() {
        let checkBoxImageViewSize: CGFloat = 24
        let stackViewHeight: CGFloat = 82
        
        NSLayoutConstraint.activate([
            checkBoxImageView.heightAnchor.constraint(equalToConstant: checkBoxImageViewSize),
            checkBoxImageView.widthAnchor.constraint(equalToConstant: checkBoxImageViewSize),
            stackView.heightAnchor.constraint(equalToConstant: stackViewHeight),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
