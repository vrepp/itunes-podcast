//
//  AppCoordinator.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 27.06.2022..
//

import UIKit

final class AppCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    private let window: UIWindow
    
    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        
        let childCoordinator = ListCoordinator(navigationController: navigationController)
        addChild(childCoordinator)
        childCoordinator.parentCoordinator = self
        childCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard
            let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(fromViewController)
        else { return }
        
        // Remove Child Coordinator when RootViewController pops from Navigation Stack
        if let childCoordinator = childCoordinators.first(where: { $0.navigationController.viewControllers.first === fromViewController }) {
            removeChild(childCoordinator)
        }
    }
}
