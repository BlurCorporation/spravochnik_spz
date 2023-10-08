//
//  UIViewController.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 24.01.2023.
//

import UIKit

extension UIViewController {
    
    func lineView (color: UIColor) -> UIView {
        let view = UILabel()
        view.backgroundColor = color
        view.layer.masksToBounds = true
        view.layer.cornerRadius = Constants.Sizes.cornerRadiusAllLine
        return view
    }
}
