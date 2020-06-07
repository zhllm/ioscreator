//
//  ConnBookViewController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/26.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit
import SnapKit
// , UIPageViewControllerDelegate, UIPageViewControllerDataSource
class ConnBookViewController: UIViewController {
  
    override func viewDidLoad() {
        // DragViewController() ScaleViewController
        // ThreeDimensionsViewController CharViewController
        let childContent = LineViewController()
        self.view.addSubview(childContent.view)
        self.addChild(childContent)
    }
}

