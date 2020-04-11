//
//  HomeViewController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/26.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit
import SnapKit
/**
 , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
 */

class HomeViewController: UIViewController {
    
    var collectionView: UICollectionView!
    func getWidthWithText(text: String, height: CGFloat, font: CGFloat) -> CGFloat{
        var tt = text
        var ft = font
        var ht = height
        if text == "" {
            tt = "无"
        }
        
        if font <= 0 {
            ft = 13.0
        }
        if height < 0 {
            ht = 0
        }
        
        let sizes: CGRect = (tt as NSString).boundingRect(with: CGSize(width: CGFloat.infinity, height: ht), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: ft)], context: nil)
        return sizes.size.width
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("init")
        /* collectionView = UICollectionView()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints({(make) in
            make.edges.equalToSuperview()
        })
        collectionView.delegate = self
        collectionView.dataSource = self */
        
        let width = getWidthWithText(text: "今日无效", height: 30.0, font: 13.0)
        
        let parent = UIView()
        parent.backgroundColor = UIColor.green
        view.addSubview(parent)
        
        parent.snp.makeConstraints({(make) in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-50)
        })
        
        let child1 = UIView()
        let child2 = UIView()
        child1.backgroundColor = .blue
        parent.addSubview(child1)
        parent.addSubview(child2)
        child1.snp.makeConstraints({(make) in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().dividedBy(3).multipliedBy(5)
            make.bottom.equalToSuperview().offset(-50)
        })
        let hsd = parent.frame.intersects(child1.frame)
        child2.snp.makeConstraints({(make) in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(100)
            make.width.equalTo(100)
            make.height.equalTo(100)
        })
        child2.backgroundColor = .red
        print("\(hsd)")
        
        let hsd2 = parent.frame.intersects(child2.frame)
        print("\(hsd2)")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
    
//    func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?{
//
//    }
    
}
