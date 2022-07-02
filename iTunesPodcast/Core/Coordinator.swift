//
//  Coordinator.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 27.06.2022..
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start()
}

extension Coordinator {
    
    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator?) {
        guard let coordinator = coordinator, childCoordinators.isEmpty == false
        else { return }
        
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
}
