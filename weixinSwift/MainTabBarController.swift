//
//  MainTabBarController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/26.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var home: UIViewController?
    var discover: UIViewController?
    var connbook: UIViewController?
    var mine: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = HomeViewController()
        home.tabBarItem = UITabBarItem(title: "微信", image: UIImage(named: "md"), selectedImage: nil)
        home.view.backgroundColor = UIColor.white
        self.home = home
        
        let discover = DiscoverViewController()
        discover.view.backgroundColor = UIColor.white
        discover.tabBarItem.badgeValue = "8"
        
        discover.tabBarItem = UITabBarItem(title: "发现", image: UIImage(named: "md"), selectedImage: nil)
        discover.view.backgroundColor = UIColor.white
        self.discover = discover
        
        let connbook = ConnBookViewController()
        connbook.view.backgroundColor = UIColor.blue
        
        connbook.tabBarItem = UITabBarItem(title: "联系人", image: UIImage(named: "md"), selectedImage: nil)
        connbook.view.backgroundColor = UIColor.white
        self.connbook = connbook
        
        let mine = MineViewController()
        mine.tabBarItem.title = "我"
        mine.view.backgroundColor = UIColor.yellow
        
        mine.tabBarItem = UITabBarItem(title: "我", image: UIImage(named: "md"), selectedImage: nil)
        mine.view.backgroundColor = UIColor.white
        self.mine = mine
        
        self.delegate = self;
        
        
        self.setViewControllers([
            UINavigationController(rootViewController: connbook),
            UINavigationController(rootViewController: home),
            UINavigationController(rootViewController: mine),
            UINavigationController(rootViewController: discover),
        ], animated: true)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        print(viewController)
        
        if viewController.isEqual(self.mine) {
           
        } else if viewController.isEqual(self.home){
            self.navigationItem.title = "花有重开日"
        } else if viewController.isEqual(self.discover){
            self.navigationItem.title = "人无再少年"
        } else if viewController.isEqual(self.connbook){
            self.navigationItem.title = "将进酒，杯莫停"
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, willBeginCustomizing viewControllers: [UIViewController]){
        print(111)
    }

}
