//
//  CustomButton.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 06.02.2023.
//

import UIKit

enum ButtonMode {
    case black
    case white
    case transparent
}

class CustomButton: UIButton {
    let mode: ButtonMode
    
    required init(mode: ButtonMode) {
        self.mode = mode
        super.init(frame: CGRect.zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomButton {
    func setupButton() {
        titleLabel?.font = .boldSystemFont(ofSize: 17)
        layer.cornerRadius = 13
        switch mode {
        case .white:
            backgroundColor = .white
            layer.borderColor = UIColor.black.cgColor
            layer.borderWidth = 1.6
            setTitleColor(.black, for: .normal)
        case .black:
            backgroundColor = .black
            setTitleColor(.white, for: .normal)
        case .transparent:
            backgroundColor = Constants.Colors.clear
            setTitleColor(.lightGray, for: .normal)
        }
    }
}
