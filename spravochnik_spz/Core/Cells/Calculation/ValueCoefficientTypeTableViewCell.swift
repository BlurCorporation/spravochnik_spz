//
//  ValueCoefficientTypeTableViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 24.02.2023.
//

import UIKit

// MARK: - ValueCoefficientTableViewCellDelegate

protocol ValueCoefficientTableViewCellDelegate: AnyObject {
    func valueCoefficientCellPressed(value: Double,
                                     type: ValueСoefficientType,
                                     index: Int)
}

// MARK: ValueCoefficientTableViewCell

final class ValueCoefficientTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ValueCoefficientTableViewCell"
    
    weak var delegate: ValueCoefficientTableViewCellDelegate?
    
    // MARK: - PrivateProperties
    
    private var value: Double = .zero
    private var type: ValueСoefficientType?
    private var index: Int = .zero
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.b1
        label.numberOfLines = .zero
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = Constants.Sizes.borderWidth
        button.layer.borderColor = Constants.Colors.lightGray.cgColor
        button.setTitleColor(Constants.Colors.dark,
                             for: .normal)
        button.titleLabel?.font = Constants.Fonts.h4
        button.layer.cornerRadius = Constants.Sizes.buttonInCellCornerRadius
        button.clipsToBounds = true
        button.addTarget(self,
                         action: #selector(buttonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = Constants.Fonts.b1
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 4,
                                               left: 16,
                                               bottom: 4,
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
    
    func configure(with viewModel: ValueСoefficientViewModel, index: Int) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.descrpt
        value = viewModel.value
        type = viewModel.type
        delegate = viewModel.delegate
        
        self.index = index // Это не то же самое, что self.value? проверить
        
        if viewModel.value != .zero {
            button.setTitle("\(viewModel.value)", for: .normal)
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func buttonPressed() {
        delegate?.valueCoefficientCellPressed(value: value,
                                              type: type ?? .lengthOfThePerimeter,
                                              index: index)
    }
}

// MARK: - ExtensionValueCoefficientTableViewCell

private extension ValueCoefficientTableViewCell {
    func setupCell() {
        selectionStyle = .none
        stackView.addArrangedSubviews(titleLabel,
                                      button,
                                      descriptionLabel)
        
        contentView.addSubviews(stackView)
    }
    
    func setupContsraints() {
        let buttonWidth: CGFloat = 80
        let buttonHeight: CGFloat = 32
        let descriptionLabelWidth: CGFloat = 30
        let stackViewHeight: CGFloat = 48
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: buttonWidth),
            button.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            descriptionLabel.widthAnchor.constraint(equalToConstant: descriptionLabelWidth),
            
            stackView.heightAnchor.constraint(equalToConstant: stackViewHeight),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
