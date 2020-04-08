//
//  AppDelegate.swift
//  SwiftyLoaderExample
//
//  Created by Orkan Çep on 8.04.2020.
//  Copyright © 2020 Orkan Çep. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let mainView = ViewController()
        window?.rootViewController = UINavigationController(rootViewController: mainView)
        window?.makeKeyAndVisible()
        
        return true
    }



}

