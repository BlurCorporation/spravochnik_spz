//
//  CustomTextField.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 14.02.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let padding = UIEdgeInsets(top: 0,
                               left: 10,
                               bottom: 0,
                               right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

extension CustomTextField {
    func setupTextField() {
        layer.borderWidth = 1
        layer.borderColor = Constants.Colors.grey.cgColor
        layer.cornerRadius = 11
    }
}
