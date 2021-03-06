//
//  AppCoordinator.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 1/5/22.
//

import Foundation
import UIKit

protocol AppCoordinatorOutput: AnyObject {
    func navigateToExerciseDetail(id: Int)
}

final class AppCoordinator: NSObject {

    // MARK: - Properties
    let window: UIWindow
    var children: [Coordinator] = []
    let application: UIApplication
    let launchOptions: [UIApplication.LaunchOptionsKey: Any]?

    let navigationController = UINavigationController()


    // MARK: - Startup
    init(window: UIWindow, application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.window = window
        self.application = application
        self.launchOptions = launchOptions
    }
}

extension AppCoordinator: Coordinator, AppCoordinatorOutput {
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
    
    func navigateToExerciseDetail(id: Int) {
        let storyboard = UIStoryboard(name: .exerciseDetailViewController, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: .exerciseDetailViewController) as? ExerciseDetailViewController else {
            preconditionFailure("Unable to instantiate a ExerciseDetailViewController with the name")
        }
        vc.viewModel = ExerciseDetailViewModelImpl(id: id, coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}



public protocol Coordinator {
    func start()
}

fileprivate extension String {
    static let exerciseListViewController = "ExerciseListViewController"
    static let exerciseDetailViewController = "ExerciseDetailViewController"
}
