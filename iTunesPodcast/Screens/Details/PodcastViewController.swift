//
//  PodcastViewController.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 02.07.2022..
//

import UIKit
import Combine

protocol PodcastViewControllerCoordinatable: AnyObject {}

final class PodcastViewController: UIViewController, MainViewCustomizable {
    // MARK: MainViewCustomizable
    typealias MainView = PodcastView
    
    weak var coordinator: PodcastViewControllerCoordinatable?
    
    private var viewModel: PodcastViewModel
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: UIViewController Lifecycle
    init(viewModel: PodcastViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindOutput()
    }
    
    // MARK: Binding
    private func bindOutput() {
        viewModel.$title
            .receive(on: RunLoop.main)
            .sink { [weak self] in self?.navigationItem.title = $0 }
            .store(in: &subscriptions)
    
    }
}
