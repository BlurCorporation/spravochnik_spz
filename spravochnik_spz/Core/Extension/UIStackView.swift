//
//  UIStackView+Extension.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.01.2023.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .equalSpacing
    }
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
