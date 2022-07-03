//
//  PodcastCoordinator.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 27.06.2022..
//

import UIKit

final class PodcastCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [] 
    let navigationController: UINavigationController
    
    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let listViewModel = PodcastListViewModel()
        let listViewController = PodcastListViewController(viewModel: listViewModel)
        listViewController.coordinator = self
        
        self.navigationController.setViewControllers([listViewController], animated: false)
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - ListViewControllerCoordinatable
extension PodcastCoordinator: PodcastListViewControllerCoordinatable {
    
    func coordinateShowDetails(with viewModel: PodcastDetailsViewModel) {
        let podcastViewController = PodcastDetailsViewController(viewModel: viewModel)
        podcastViewController.coordinator = self
        
        self.navigationController.pushViewController(podcastViewController, animated: true)
    }
}

// MARK: - PodcastViewControllerCoordinatable
extension PodcastCoordinator: PodcastDetailsViewControllerCoordinatable {}
