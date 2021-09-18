//
//  AppDelegate.swift
//  camptools
//
//  Created by  on 2021/09/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // tabbar
        UITabBar.appearance().tintColor = UIColor.rgba(red: 52, green: 85, blue: 65, alpha: 1)
        UITabBarItem.appearance().setTitleTextAttributes( [ .font : UIFont.init(name: "HelveticaNeue-Bold", size: 10) as Any, .foregroundColor : UIColor.blue ], for: .normal)
        UITabBar.appearance().barTintColor = UIColor.white
        
        //　navigationBar
        UINavigationBar.appearance().barTintColor = UIColor.rgba(red: 52, green: 85, blue: 65, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        return true
    }

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

