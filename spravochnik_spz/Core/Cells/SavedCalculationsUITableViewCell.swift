//
//  SavedCalculationsUITableViewCell.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 08.02.2023.
//

import UIKit

// MARK: - SavedCalculationsUITableViewCellProtocol

protocol SavedCalculationsUITableViewCellProtocol: AnyObject {
    func set(object: SavedCalculationsCellModel, backgroundImage: UIImage)
}

// MARK: SavedCalculationsUITableViewCell

final class SavedCalculationsUITableViewCell: UITableViewCell {
    
    // MARK: - PrivateProperties
    
    static let identifier = "TableViewCell"
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.type
        label.textColor = Constants.Colors.type
        return label
    }()
    
    private let typeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let typeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.Sizes.littleStackViewSpacing
        return stackView
    }()
    
    private let addressLabel : UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.address
        label.textColor = Constants.Colors.address
        label.numberOfLines = 0
        return label
    }()
    
    private let addrTypeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.Sizes.littleStackViewSpacing
        stackView.alignment = .leading
        return stackView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.date
        label.textColor = Constants.Colors.date
        return label
    }()
    
    private let dateImage: UIImageView = {
        let image = Constants.Images.date
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    private let dateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.Sizes.littleStackViewSpacing
        return stackView
    }()
    
    private let stagesLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.stages
        label.textColor = Constants.Colors.stages
        return label
    }()
    
    private let stageImage: UIImageView = {
        let image = Constants.Images.stage
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    private let stageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.Sizes.littleStackViewSpacing
        return stackView
    }()
    
    private let stagesDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = Constants.Sizes.littleStackViewSpacing
        return stackView
    }()
    
    private let costLabel: PaddingCostLabel = {
        let label = PaddingCostLabel()
        label.font = Constants.Fonts.cost
        label.textColor = Constants.Colors.cost
        label.layer.borderWidth = Constants.Sizes.borderWidth
        label.layer.cornerRadius = Constants.Sizes.costCornerRadius
        label.layer.borderColor = Constants.Colors.whiteCellColor.cgColor
        label.textAlignment = .center
        return label
    }()
    
    private let stagesDateCostStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.alignment = .center
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.Sizes.bigStackViewSpacing
        return stackView
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupContsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override funcs
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4,
                                                                     left: 16,
                                                                     bottom: 4,
                                                                     right: 16))
    }
}




// MARK: - SavedCalculationsUITableViewCellProtocol Impl

extension SavedCalculationsUITableViewCell: SavedCalculationsUITableViewCellProtocol {
    func set(object: SavedCalculationsCellModel,
             backgroundImage: UIImage) {
        self.typeImage.image = object.image
        self.backgroundImage.image = backgroundImage
        self.addressLabel.text = "\(object.address)"
        self.typeLabel.text = "\(object.type)"
        self.dateLabel.text = "\(object.date)"
        self.stagesLabel.text = "\(object.stages)"
        self.costLabel.text = "₽ \(object.cost.formattedWithSeparator)"
    }
}

// MARK: - Private Methods

private extension SavedCalculationsUITableViewCell {
    func setupCell(){
        contentView.addSubviews(backgroundImage,
                                mainStackView)
        typeStackView.addArrangedSubviews(typeImage,
                                          typeLabel)
        addrTypeStackView.addArrangedSubviews(addressLabel,
                                              typeStackView)
        stageStackView.addArrangedSubviews(stageImage,
                                           stagesLabel)
        dateStackView.addArrangedSubviews(dateImage,
                                          dateLabel)
        stagesDateStackView.addArrangedSubviews(dateStackView,
                                                stageStackView)
        stagesDateCostStackView.addArrangedSubviews(stagesDateStackView,
                                                    costLabel)
        mainStackView.addArrangedSubviews(addrTypeStackView,
                                          stagesDateCostStackView)
        contentView.layer.cornerRadius = Constants.Sizes.savedCalcCellCornerRadius
        contentView.backgroundColor = Constants.Colors.clear
    }
    
    func setupContsraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                               constant: Constants.Constraints.topOffset),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                   constant: Constants.Constraints.leadingOffset),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                    constant: Constants.Constraints.trailingOffset),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,
                                                  constant: Constants.Constraints.bottomOffset),
            
            costLabel.heightAnchor.constraint(equalToConstant: Constants.Sizes.costHeight)
        ])
    }
}
