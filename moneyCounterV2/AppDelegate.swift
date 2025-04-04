//
//  AppDelegate.swift
//  moneyCounterV2
//
//  Created by Ярослав Строков on 03.04.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController() // Убедись, что ViewController существует
        window?.makeKeyAndVisible()
        
        return true
    }
}
