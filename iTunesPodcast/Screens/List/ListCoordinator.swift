//
//  ListCoordinator.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 27.06.2022..
//

import UIKit

final class ListCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [] 
    let navigationController: UINavigationController
    
    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let listViewModel = ListViewModel()
        let listViewController = ListViewController(viewModel: listViewModel)
        listViewController.coordinator = self
        
        self.navigationController.setViewControllers([listViewController], animated: false)
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
}
