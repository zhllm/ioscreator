//
//  MKLayout.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/4/5.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

let SectionBackground = "UCollectionReusableView"


class MKLayout: UICollectionViewFlowLayout {
    
    var arrItemHeight: [CGFloat]!
    
    var arrAttributes: [UICollectionViewLayoutAttributes]!

    override init() {
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func flowLayoutWithItem(width: CGFloat, itemHeightArray: [CGFloat]) {
        self.itemSize = CGSize(width: width, height: 0)
        self.arrItemHeight = itemHeightArray
        self.collectionView?.reloadData()
    }

    override func prepare() {
        super.prepare()
        
        if self.arrItemHeight.count == 0 {
            return
        }
        guard let contentWidth = self.collectionView?.contentSize.width else {
            return
        }

        let numbers = (contentWidth - self.sectionInset.right - self.sectionInset.left + self.minimumInteritemSpacing) / (self.itemSize.width + self.minimumInteritemSpacing)
        
        guard numbers != 0 else {
            return
        }
        
        let nItemInRow = Int(numbers)
        
        var arrmColumnLength: [CGFloat] = []
        for _ in 0..<nItemInRow {
            arrmColumnLength.append(0)
        }
        
        for (index, value) in arrItemHeight.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let attr = self.layoutAttributesForItem(at: indexPath)
            var rectFrame = attr?.frame
            rectFrame?.size.height = value
            var nNumShort: Int = 0
        }
        
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]?{
        
        return self.arrAttributes
    }

}
