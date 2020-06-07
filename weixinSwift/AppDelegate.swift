//
//  AppDelegate.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/26.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
        let addEventIcon = UIApplicationShortcutIcon(type: .add)
        let unlockEventIcon = UIApplicationShortcutIcon(templateImageName: "md")
        let listEventIcon = UIApplicationShortcutIcon(templateImageName: "md")
        
        
        let addEvent = UIApplicationShortcutItem(type: "beyourself1994.weixinSwift.action", localizedTitle: "Add", localizedSubtitle: "Add menber", icon: addEventIcon, userInfo: nil)
        
        let unlockEvent = UIApplicationShortcutItem(type: "beyourself1994.weixinSwift.unlockEvent", localizedTitle: "unlockEvent", localizedSubtitle: "unlockEvent menber", icon: unlockEventIcon, userInfo: nil)
        
        let listEvent = UIApplicationShortcutItem(type: "beyourself1994.weixinSwift.listEvent", localizedTitle: "listEvent", localizedSubtitle: "listEvent menber", icon: listEventIcon, userInfo: nil)
        
        let shortItems = [addEvent, unlockEvent, listEvent]
        
        application.shortcutItems = shortItems
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        if shortcutItem.type == "beyourself1994.weixinSwift.action" {
            print("Navigator to page adding menber")
        } else if shortcutItem.type == "beyourself1994.unlockEvent" {
            print("unlockEvent to page adding menber")
        } else if shortcutItem.type == "beyourself1994.listEvent" {
            print("listEvent to page adding menber")
        }
    }
    
//    static func uncaughtExceptionHandler(NSException *exception) {
//
//        NSLog(@"%@\n%@", exception, [exception callStackSymbols]);
//
//    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

