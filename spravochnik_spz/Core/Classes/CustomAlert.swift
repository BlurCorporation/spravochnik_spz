//
//  CustomAlert.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 08.03.2023.
//

import UIKit

protocol CustomAlertProtocol: UIView {
    func leftButtonHandler()
    func rightButtonHandler()
}

class CustomAlert: UIView {

    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Уверены, что хотите выйти из аккаунта"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let leftButton: CustomButton = {
        let button = CustomButton()
        button.mode = .white
        button.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let rightButton: CustomButton = {
        let button = CustomButton()
        button.mode = .black
        button.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let leftRightButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
        self.setupConstraints()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func rightButtonPressed() {
        leftButtonHandler()
    }
    
    @objc func leftButtonPressed() {
        rightButtonHandler()
    }

    
    func addCustomView() {
        // создайте объект эффекта размытия
        let blurEffect = UIBlurEffect(style: .extraLight)

        // создайте объект визуального эффекта, используя эффект размытия
        let blurView = UIVisualEffectView(effect: blurEffect)

        // установите размер и положение эффекта размытия, чтобы он покрыл весь экран, включая SafeArea
        blurView.frame = UIScreen.main.bounds

        
        leftButton.setTitle("Закрыть", for: .normal)
        rightButton.setTitle("Сохранить", for: .normal)
        
        
        leftRightButtonsStackView.addArrangedSubviews(leftButton, rightButton)
        self.addSubviews(blurView, backgroundView, titleLabel, leftRightButtonsStackView)
    }
    
}

private extension CustomAlert {
    func setupConstraints() {
        let offset = CGFloat(16)
        let logoutButtonSize = CGFloat(40)
        let logoImageSize = CGFloat(80)
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 264),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 45),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -45),
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 64),
            
            leftRightButtonsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 24),
            leftRightButtonsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -24),
            leftRightButtonsStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -64),
            leftRightButtonsStackView.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}


extension CustomAlert: CustomAlertProtocol {
    func leftButtonHandler() {
        self.removeFromSuperview()
    }
    
    func rightButtonHandler() {
        
    }
    
    
}
