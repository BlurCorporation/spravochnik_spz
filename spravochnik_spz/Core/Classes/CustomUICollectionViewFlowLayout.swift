//
//  CustomUICollectionViewFlowLayout.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 25.02.2023.
//

import UIKit

protocol CustomLayoutDelegate {
     //This method accept the height for your cell.
     func heightFor(index : Int) -> CGFloat
  }

class CustomUICollectionViewFlowLayout: UICollectionViewFlowLayout {
    //Variables
    var layoutDelegate : CustomLayoutDelegate?
    var leftY = CGFloat(0)
    var rightY = CGFloat(0)
    var cache = [UICollectionViewLayoutAttributes]()
    let margin = CGFloat(16)
    //This method sets the frame (attributes) for every cell and store in chache.
    override func prepare() {
        guard  cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        
        let verticalSpacing = CGFloat(8)
        let horizontalSpacing = CGFloat(8)
        
        leftY = 0
        rightY = 0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0){
            var frame = CGRect.zero
            let cellHeight = self.layoutDelegate!.heightFor(index: item)
            
            frame.size.height = cellHeight
            
            if item != collectionView.numberOfItems(inSection: 0) - 1 {
                frame.size.width = (collectionView.frame.size.width - 2 * margin) / 2 - horizontalSpacing/2
            } else {
                frame.size.width = (collectionView.frame.size.width - 2 * margin)
            }
            
            if item % 2 == 0{
                frame.origin.x = margin
                frame.origin.y = leftY
                leftY += cellHeight + verticalSpacing
            } else {
                frame.origin.x = (collectionView.frame.size.width + margin) / 2 - (horizontalSpacing / 2)
                frame.origin.y = rightY
                rightY += cellHeight + verticalSpacing
            }
            
            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes)
        }
    }
    
    // This method returns the array of
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        // Loop through the cache and look for items in the rect
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    //This method sets the collection view's content size.
    override var collectionViewContentSize: CGSize {
        return CGSize.init(width: collectionView!.frame.size.width, height: max(leftY, rightY))
    }
}
