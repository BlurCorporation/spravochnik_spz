////
////  PageViewCellView.swift
////  spravochnik_spz
////
////  Created by Natalia Shevaldina on 23.03.2023.
////
//
//import UIKit
//
//class PageViewCellView: UICollectionViewCell {
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    translatesAutoresizingMaskIntoConstraints = false
//  }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func fill(view content: UIView) {
//      subviews.forEach { $0.removeFromSuperview() }
//          
//      addSubview(content)
//      NSLayoutConstraint.activate([
//        content.topAnchor.constraint(equalTo: topAnchor),
//        content.bottomAnchor.constraint(equalTo: bottomAnchor),
//        content.leadingAnchor.constraint(equalTo: leadingAnchor),
//        content.trailingAnchor.constraint(equalTo: trailingAnchor),
//      ])
//    }
//}
