//
//  ValueCoefficientTypeTableViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 24.02.2023.
//

import UIKit

// MARK: - ValueCoefficientTableViewCellDelegate

protocol ValueCoefficientTableViewCellDelegate: AnyObject {
    func buttonPressed(value: Double)
}

// MARK: ValueCoefficientTableViewCell

final class ValueCoefficientTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ValueCoefficientTableViewCell"
    
    weak var delegate: ValueCoefficientTableViewCellDelegate?
    
    // MARK: - PrivateProperties
    
    private var value: Double = .zero
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.firstSectionResultsFont
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = Constants.Sizes.borderWidth
        button.layer.borderColor = Constants.Colors.lightGray.cgColor
        button.setTitleColor(Constants.Colors.dark,
                             for: .normal)
        button.titleLabel?.font = Constants.Fonts.mainCellFont
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = Constants.Fonts.firstSectionResultsFont
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 6
        stackView.alignment = .center
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
    
    func configure(with viewModel: ValueСoefficientViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.descrpt
        value = viewModel.value
    }
    
    // MARK: - Actions
    
    @objc
    private func buttonPressed() {
        print(#function)
        delegate?.buttonPressed(value: value)
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
        let descriptionLabelWidth: CGFloat = 30
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: buttonWidth),
            button.heightAnchor.constraint(equalToConstant: 32),
            
            descriptionLabel.widthAnchor.constraint(equalToConstant: descriptionLabelWidth),
            
            stackView.heightAnchor.constraint(equalToConstant: 48),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
