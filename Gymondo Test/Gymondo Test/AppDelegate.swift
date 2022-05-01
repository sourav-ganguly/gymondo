//
//  AppDelegate.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 30/4/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window!, application: application, launchOptions: launchOptions)
        appCoordinator.start()
        return true
    }


}

