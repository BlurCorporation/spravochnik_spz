//
//  CalculationHeaderViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 24.02.2023.
//

import UIKit

//MARK: - CalculationHeaderViewCell

protocol CalculationHeaderViewCellCellDelegate: AnyObject {
    func quitButtonPressed()
}

final class CalculationHeaderViewCell: UITableViewHeaderFooterView {
    
    //MARK: - Private Properties
    
    static let identifier = "CalculationHeaderViewCell"
    
    weak var delegate: CalculationHeaderViewCellCellDelegate?
    
    private lazy var quitButton: UIButton = {
        let button = UIButton(type: .system)
        let image = Constants.Images.quitButtom
        button.setImage(image,
                        for: .normal)
        button.tintColor = .black
        button.addTarget(self,
                         action: #selector(quitButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let headerViewLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Constants.Fonts.h2
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
        delegate = viewModel.delegate
    }
    
    // MARK: - Actions
    
    @objc
    private func quitButtonPressed() {
        delegate?.quitButtonPressed()
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
        contentView.addSubviews(headerViewLabel,
                                quitButton)
    }
    
    func setupContsraints() {
        NSLayoutConstraint.activate([
            headerViewLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            headerViewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                     constant: Constants.Constraints.leadingHeaderOffset),
            headerViewLabel.widthAnchor.constraint(equalToConstant: Constants.Sizes.widthHeader),
            
            quitButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            quitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -Constants.Constraints.leadingHeaderOffset)
        ])
    }
}

