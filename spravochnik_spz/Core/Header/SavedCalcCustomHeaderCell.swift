//
//  SavedCalcCustomHeaderCell.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 14.02.2023.
//

import UIKit

// MARK: - SavedCalcCustomHeaderCellProtocol

protocol SavedCalcCustomHeaderCellProtocol: AnyObject {}

//MARK: - SavedCalcCustomHeaderCell

final class SavedCalcCustomHeaderCell: UITableViewHeaderFooterView {
    
    //MARK: - Private Properties
    
    static let identifier = "TableViewHeader"
    
    private let savedCalcLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.text = "savedCalculationsTitleLabelText".localized
        label.font = Constants.Fonts.h2
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Inits
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        addSubViews()
        setupContsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SavedCalcCustomHeaderCellProtocol Impl

extension SavedCalcCustomHeaderCell: SavedCalcCustomHeaderCellProtocol {}

// MARK: - Private Methods

private extension SavedCalcCustomHeaderCell {
    func setupViews() {
        contentView.backgroundColor = .systemBackground
    }
    
    func addSubViews() {
        contentView.addSubviews(savedCalcLabel)
    }
    
    func setupContsraints() {
        NSLayoutConstraint.activate([
            savedCalcLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            savedCalcLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: Constants.Constraints.leadingHeaderOffset),
            savedCalcLabel.widthAnchor.constraint(equalToConstant: Constants.Sizes.widthHeader)
        ])
    }
}
