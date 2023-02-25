//
//  MainCollectionViewCell.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 25.02.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.backgroundColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainCollectionViewCell {
    func setupCell() {
        contentView.addSubviews(label)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            label.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
