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

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        appCoordinator = AppCoordinator(window: window!, application: application, launchOptions: launchOptions)
        appCoordinator.start()
        return true
    }


}

