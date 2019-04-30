//
//  AppDelegate.swift
//  SpotlightSearchDemo
//
//  Created by Yiyin Shen on 30/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        SpotlightSearchManager().deleteSearchableItems(with: ["Pear", "Banana"])
        SpotlightSearchManager().indexSearchableItems()
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        let viewController = application.keyWindow?.rootViewController
        viewController?.restoreUserActivityState(userActivity)
        return true
    }
}

