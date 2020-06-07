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
    
    var headers = ["页面1", "页面2", "页面3"]
    var footers = ["这里是页面1，具体内容如下", "这里是页面2，具体内容如下，是一个好人的东莨菪碱", "这里是页面3"]
    var imageNames = ["iOS", "swift", "beginner"]
    
    var vcs:[UIViewController]?
    
    lazy var pvController: UIPageViewController = {
        return UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }()
    
    var imageView: UIImageView!
    var isTOuchInImageView: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.pvController.delegate = self
//        self.view.backgroundColor = UIColor.white
//        self.pvController.dataSource = self
//        if let startVC = getViewController(at: 0) {
//            pvController.setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
//            self.addChild(pvController)
//            self.view.addSubview(pvController.view)
//        }
        let uView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        // navigationController?.navigationItem.titleView = uView
        navigationItem.titleView = uView
//        uView.snp.makeConstraints({(make) in
//            make.leading.equalToSuperview().offset(120)
//            make.trailing.equalToSuperview().offset(-120)
//        })
        uView.backgroundColor = .yellow
        let image = UIImage(named: "md")
        self.imageView = UIImageView(image: image)
        self.view.addSubview(self.imageView)
        
        self.imageView.frame.origin.y = 120
//        self.imageView.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        let touch = touches.first
        let touchPoint = touch?.location(in: self.view)
        
        let imageViewFram = self.imageView.frame
        let minX = imageViewFram.origin.x
        let minY = imageViewFram.origin.y
        let maxX = minX + imageViewFram.size.width
        let maxY = minY + imageViewFram.size.height
        if  (touchPoint?.x)! >= minX &&
            (touchPoint?.x)! <= maxX &&
            (touchPoint?.y)! >= minY &&
            (touchPoint?.y)! <= maxY {
            isTOuchInImageView = true
            print("isTOuchInImageView")
            print(isTOuchInImageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isTOuchInImageView {
            return;
        }
        let touch = touches.first
        let touchPoint = touch?.location(in: self.view)
        let touchPrePoint = touch?.previousLocation(in: self.view)
        let disX = (touchPoint?.x)! - (touchPrePoint?.x)!
        let disY = (touchPoint?.y)! - (touchPrePoint?.y)!
        print(disX)
        print(disY)
        var centerPoint = self.imageView.center
        centerPoint.x += disX
        centerPoint.y += disY
        self.imageView.center = centerPoint
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
        isTOuchInImageView = false
    }
    
    func getViewController(at index: Int) -> ContentViewController? {
        if case 0..<headers.count = index {
            let vc = ContentViewController(index: index, title: "")
            return vc
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index -= 1
        
        return getViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index += 1
        
        return getViewController(at: index)
    }

}

