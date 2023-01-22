//
//  PerimeterAlarmSystemViewController.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 22.01.2023.
//

import UIKit

// MARK: -  PerimeterAlarmSystemViewProtocol

protocol  PerimeterAlarmSystemViewProtocol: UIViewController {}

// MARK: -  PerimeterAlarmSystemViewController

final class  PerimeterAlarmSystemViewController: UIViewController {
    var presenter:  PerimeterAlarmSystemPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

// MARK: -  PerimeterAlarmSystemViewProtocol Impl

extension  PerimeterAlarmSystemViewController:  PerimeterAlarmSystemViewProtocol {}

// MARK: - PrivateMethods

private extension  PerimeterAlarmSystemViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
