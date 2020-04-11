//
//  SceneDelegate.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/26.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            let mainPage = MainTabBarController()
            let navigator = UINavigationController(
            rootViewController: mainPage)
            // navigator.navigationBar.barStyle = UIBarStyle.black
            navigator.navigationBar.barStyle = UIBarStyle.default
            navigator.navigationBar.tintColor = UIColor.yellow
            // translucent默认导航栏半透明，设置NO为不透明，显示颜色就是设定的颜色
            // 设置返回按钮的图片
            navigator.navigationBar.isTranslucent = false // 不透明
            // 隐藏navigationBar
            // navigator.isNavigationBarHidden = true
            navigator.navigationBar.isHidden = false
            // let appce = UINavigationBar.appearance()
            // appce.backIndicatorImage = UIImage(named: "md")
            self.window?.rootViewController = MainTabBarController()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

