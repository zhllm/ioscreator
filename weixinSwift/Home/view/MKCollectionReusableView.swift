//
//  MKCollectionReusableView.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/4/14.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

class MKCollectionReusableView: UICollectionReusableView {
    var label: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel()
        self.addSubview(label)
        label.snp.makeConstraints({(make) in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(_ indexPath: IndexPath) {
        label.text = "this section number is \(indexPath.section)"
    }
}
