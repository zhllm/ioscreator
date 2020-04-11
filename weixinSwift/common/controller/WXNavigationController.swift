//
//  WXNavigationController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/28.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

class WXNavigationController: UINavigationController, UINavigationControllerDelegate {
    var popDelegate: UIGestureRecognizerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = UIColor.black
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool){
        if viewController == self.viewControllers[0] {
            self.interactivePopGestureRecognizer?.delegate = self.popDelegate
        } else {
            self.interactivePopGestureRecognizer?.delegate = nil
        }
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool){
        if self.children.count > 0{
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem =
                UIBarButtonItem.init(image: UIImage(named: "md"), style: .plain, target: self, action: #selector(leftClick))
            
            viewController.navigationItem.leftBarButtonItem =
                UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: #selector(leftClick))
            super.pushViewController(viewController, animated: animated)
        }
    }
    
    @objc func leftClick(){
        popViewController(animated: true)
    }
    
}
