//
//  AppCoordinator.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 1/5/22.
//

import Foundation
import UIKit

final class AppCoordinator: NSObject {

    // MARK: - Properties
    let window: UIWindow
    var children: [Coordinator] = []
    let application: UIApplication
    let launchOptions: [UIApplication.LaunchOptionsKey: Any]?

    let navigationController = UINavigationController()
//    var mainCoordinator: Coordinator


    // MARK: - Startup
    init(window: UIWindow, application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.window = window
        self.application = application
        self.launchOptions = launchOptions
    }
}

extension AppCoordinator: Coordinator {
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let storyboard = UIStoryboard(name: .exerciseListViewController, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: .exerciseListViewController) as? ExerciseListViewController else {
            preconditionFailure("Unable to instantiate a ExercideListViewController with the name")
        }
        vc.viewModel = ExercideListViewModelImpl(coordinator: self)
        navigationController.setViewControllers([vc], animated: false)
    }
}



public protocol Coordinator {
    func start()
}

private extension String {
    static let exerciseListViewController = "ExerciseListViewController"
}
