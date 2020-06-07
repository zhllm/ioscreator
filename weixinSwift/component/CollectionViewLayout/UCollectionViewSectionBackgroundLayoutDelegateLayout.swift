//
//  UCollectionViewSectionBackgroundLayoutDelegateLayout.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/4/1.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

protocol  UCollectionViewSectionBackgroundLayoutDelegateLayout: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        backgroundColorForSectionAt section: Int) -> UIColor
}

extension UCollectionViewSectionBackgroundLayoutDelegateLayout{
    func collectionView(_ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    backgroundColorForSectionAt section: Int) -> UIColor{
        return collectionView.backgroundColor ?? UIColor.clear
    }
}

private class UCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes{
    var backgroundColor = UIColor.white
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! UCollectionViewLayoutAttributes
        copy.backgroundColor = self.backgroundColor
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let rhs = object as? UCollectionViewLayoutAttributes else{
            return false
        }
        if !self.backgroundColor.isEqual(rhs.backgroundColor) {
            return false
        }
        return super.isEqual(object)
    }
}

private class UCollectionReusableView: UICollectionReusableView{
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        guard let attr = layoutAttributes as? UCollectionViewLayoutAttributes else{
            return
        }
        self.backgroundColor = attr.backgroundColor
    }
}

class UCollectionViewSectionBackgroundLayout: UICollectionViewFlowLayout {
    private var decorationViewAttrs: [UICollectionViewLayoutAttributes] = []
    override init() {
        super.init()
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.register(UCollectionReusableView.classForCoder(), forDecorationViewOfKind: SectionBackground)
    }
    
    override func prepare() {
        super.prepare()
        guard let numberOfSetions = self.collectionView?.numberOfSections, let delegate = self.collectionView?.delegate as? UCollectionViewSectionBackgroundLayoutDelegateLayout else{
            return
        }
        self.decorationViewAttrs.removeAll()
        for section in 0..<numberOfSetions {
            let indexPath = IndexPath(item: 0, section: section)
            
            guard let numberOfItems = collectionView?.numberOfItems(inSection: section), numberOfItems > 0, let firstItem = layoutAttributesForItem(at: indexPath), let lastItem = layoutAttributesForItem(at: IndexPath(item: numberOfItems - 1, section: section)) else {
                continue
            }
            
            var inset = self.sectionInset
            if let delegateInset = delegate.collectionView?(self.collectionView!, layout: self, insetForSectionAt: section) {
                inset = delegateInset
            }
            
            var sectionFrame = firstItem.frame.union(lastItem.frame)
            sectionFrame.origin.x = inset.left
            sectionFrame.origin.y -= inset.top
        }
        
    }
}
