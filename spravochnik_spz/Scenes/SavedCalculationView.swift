//
//  SavedCalculationView.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 15.04.2023.
//

import UIKit

class SavedCalculationView: UIView {
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.Images.file
        return imageView
    }()
    
    private let savedCalcTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TextLabels.savedCalcTitle
//        label.font =
        label.numberOfLines = 0
        label.textAlignment = .center
        label.tintColor = Constants.Colors.black
        return label
    }()
    
    private let savedCalcTextLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TextLabels.savedCalcText
//        label.font =
        label.numberOfLines = 0
        label.textAlignment = .center
        label.tintColor = Constants.Colors.lightGrey
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = Constants.Sizes.spasingBetweenLine
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SavedCalculationView {
    func setupView() {
        addSubViews()
        setupConstraints()
        self.backgroundColor = .systemBackground
    }
    
    func addSubViews() {
        self.addSubviews(stackView)
        self.addSubviews(image)
        stackView.addArrangedSubviews(savedCalcTitleLabel,
                                      savedCalcTextLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}

// Метод для отображения на контроллерах
//func setupSavedCalculationView() {
//    let savedCalculationView = SavedCalculationView()
//    view.addSubviews(savedCalculationView)
//    NSLayoutConstraint.activate([
//        savedCalculationView.topAnchor.constraint(equalTo: view.topAnchor),
//        savedCalculationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        savedCalculationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        savedCalculationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//    ])
//}
