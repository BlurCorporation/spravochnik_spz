//
//  DefaultValueCoefficientTypeTableViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 24.02.2023.
//
import UIKit

// MARK: - DefaultValueCoefficientTableViewCellDelegate

protocol DefaultValueCoefficientTableViewCellDelegate: AnyObject {
    func defaultValueCoefficientCellPressed(value: Double)
}

// MARK: DefaultValueCoefficientTableViewCell

final class DefaultValueCoefficientTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "DefaultCoefficientTableViewCell"
    
    weak var delegate: DefaultValueCoefficientTableViewCellDelegate?
    
    // MARK: - PrivateProperties
    
    private var value: Double = .zero
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.firstSectionResultsFont
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = Constants.Sizes.borderWidth
        button.layer.borderColor = Constants.Colors.lightGray.cgColor
        button.setTitleColor(Constants.Colors.dark,
                             for: .normal)
        button.titleLabel?.font = Constants.Fonts.mainCellFont
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
        label.font = Constants.Fonts.firstSectionResultsFont
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
    
    func configure(with viewModel: DefaultCoefficientValueViewModel) {
        titleLabel.text = viewModel.title
        button.setTitle("\(viewModel.value)", for: .normal)
        value = viewModel.value
        delegate = viewModel.delegate
    }
    
    // MARK: - Actions
    
    @objc
    private func buttonPressed() {
        delegate?.defaultValueCoefficientCellPressed(value: value)
    }
}

// MARK: - ExtensionDefaultValueCoefficientTableViewCell

private extension DefaultValueCoefficientTableViewCell {
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
