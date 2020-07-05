//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Afsal's Macbook Pro on 03/07/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        UserLocationService.instantiateSharedInstance()
        guard UserLocationService.shared.authorizationStatus != .notDetermined else {
          UserLocationService.shared.requestWhenInUseAuthorization()
          return true
        }
        
        guard let tabController = (window?.rootViewController as? UINavigationController)?.topViewController as? UITabBarController else { return false }
        
        tabController.tabBar.items?.forEach { tabBarItem in
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        return true
    }


}

