//
//  SavedCalculationsUITableViewCell.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 08.02.2023.
//

import UIKit

// MARK: - SavedCalculationsUITableViewCellProtocol

protocol SavedCalculationsUITableViewCellProtocol: AnyObject {}

// MARK: SavedCalculationsUITableViewCell

final class SavedCalculationsUITableViewCell: UITableViewCell {
    
    // MARK: - PrivateProperties
    
    static let identifier = "TableViewCell"
    
    private let systemLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Constants.Fonts.b5
        label.textColor = Constants.Colors.system
        return label
    }()
    
    private let systemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let systemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.Sizes.littleStackViewSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    private let addressLabel : PaddingLabel = {
        let label = PaddingLabel()
        label.font = Constants.Fonts.h4
        label.textColor = Constants.Colors.address
        label.contentMode = .scaleAspectFill
        label.numberOfLines = 0
        return label
    }()
    
    private let addrsystemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.Sizes.littleStackViewSpacing
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private let dateLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Constants.Fonts.b3
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
        stackView.alignment = .center
        return stackView
    }()
    
    private let stagesLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Constants.Fonts.b3
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
    
    private let costLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Constants.Fonts.b3
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
        self.setupCell()
        self.setupContsraints()
//        self.setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: SavedCalculationsCellModelProtocol?  {
        didSet {
            guard let _object = viewModel else { return }
            if oldValue?.image != _object.image {
                self.systemImage.image = _object.image
            }
            self.backgroundImage.image = _object.backgroundImage
            self.addressLabel.text = "\(_object.address)"
            self.systemLabel.text = "\(_object.system)"
            self.dateLabel.text = "\(_object.date)"
            self.stagesLabel.text = "\(_object.stages)"
            self.costLabel.text = "\(_object.cost.formattedWithSeparator)"
        }
    }
    
    // MARK: - Override funcs
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4,
                                                                     left: 16,
                                                                     bottom: 4,
                                                                     right: 16))
    }
    
    
    /// Метод для переиспользования и очистки данных в больших списках
    override func prepareForReuse() {
        
    }
    
    
}

// MARK: - Private Methods

private extension SavedCalculationsUITableViewCell {
    
    func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapHandler))
        self.addGestureRecognizer(tapGesture)
    }

    @objc
    private func viewTapHandler() {
        self.viewModel?.actionHandler?()
    }
    
    func setupCell(){
        contentView.addSubviews(backgroundImage,
                                mainStackView)
        systemStackView.addArrangedSubviews(systemImage,
                                          systemLabel)
        addrsystemStackView.addArrangedSubviews(addressLabel,
                                              systemStackView)
        stageStackView.addArrangedSubviews(stageImage,
                                           stagesLabel)
        dateStackView.addArrangedSubviews(dateImage,
                                          dateLabel)
        stagesDateStackView.addArrangedSubviews(dateStackView,
                                                stageStackView)
        stagesDateCostStackView.addArrangedSubviews(stagesDateStackView,
                                                    costLabel)
        mainStackView.addArrangedSubviews(addrsystemStackView,
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
                                               constant: Constants.Constraints.cellOffsets),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                   constant: Constants.Constraints.cellOffsets),
            contentView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: Constants.Constraints.cellOffsets),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,
                                                  constant: -Constants.Constraints.cellOffsets),
            
            costLabel.heightAnchor.constraint(equalToConstant: Constants.Sizes.costHeight),
        ])
    }
}
