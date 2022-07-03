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

// MARK: - ListViewControllerCoordinatable
extension ListCoordinator: ListViewControllerCoordinatable {
    
    func coordinateShowDetails(with viewModel: PodcastViewModel) {
        let podcastViewController = PodcastViewController(viewModel: viewModel)
        podcastViewController.coordinator = self
        
        self.navigationController.pushViewController(podcastViewController, animated: true)
    }
}

// MARK: - PodcastViewControllerCoordinatable
extension ListCoordinator: PodcastViewControllerCoordinatable {}
