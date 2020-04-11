//
//  ContentViewController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/31.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit
import SnapKit

class ContentViewController: UIViewController {
    
    var index: Int = 0
    
    init(index: Int, title: String) {
        super.init(nibName:nil, bundle:nil)
        self.index = index
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        self.view.addSubview(label)
        label.snp.makeConstraints({(make) in
            make.width.height.equalTo(100)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.centerY.equalToSuperview()
        })
        label.backgroundColor = .white
        label.text = "hello wold\(index)"
    }

}
