//
//  DiscoverViewController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/26.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "人无再少年"
        let layout = UICollectionViewFlowLayout()
        // 行间距
        layout.minimumLineSpacing = 5.0
        // 列间距
        layout.minimumInteritemSpacing = 5.0
        layout.sectionInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        layout.itemSize = CGSize(width: 100, height: 100)
        // UICollectionView.ScrollDirection.vertical
        layout.scrollDirection = .vertical
        let collect = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout: layout)
        view.addSubview(collect)
        collect.dataSource = self
        collect.delegate = self
        collect.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(arc4random() % 255) / 255.0, green: CGFloat(arc4random() % 255) / 255.0, blue: CGFloat(arc4random() % 255) / 255.0 / 255,
                                       alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        var sized: CGSize!
        if (indexPath.item % 3 != 0) {
            sized = CGSize(width: (self.view.frame.width - 20) / 2, height: 150)
        } else if (indexPath.item % 4 != 0) {
            sized = CGSize(width: (self.view.frame.width - 20) / 2, height: 75)
        }
        else {
            sized = CGSize(width: self.view.frame.width - 10, height: 150)
        }
        return sized
    }
    

}
