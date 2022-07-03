//
//  PodcastDetailsViewController.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 02.07.2022..
//

import UIKit
import Combine

protocol PodcastDetailsViewControllerCoordinatable: AnyObject {}

final class PodcastDetailsViewController: UIViewController, MainViewCustomizable {
    // MARK: MainViewCustomizable
    typealias MainView = PodcastDetailsView
    
    weak var coordinator: PodcastDetailsViewControllerCoordinatable?
    
    private var viewModel: PodcastDetailsViewModel
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: UIViewController Lifecycle
    init(viewModel: PodcastDetailsViewModel) {
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
    
        viewModel.$artistName
            .receive(on: RunLoop.main)
            .sink { [weak self] in self?.mainView.artistNameLabel.text = $0 }
            .store(in: &subscriptions)
        
        viewModel.$trackName
            .receive(on: RunLoop.main)
            .sink { [weak self] in self?.mainView.trackNameLabel.text = $0 }
            .store(in: &subscriptions)
        
        viewModel.$releaseDate
            .receive(on: RunLoop.main)
            .sink { [weak self] in self?.mainView.releaseDateLabel.text = $0 }
            .store(in: &subscriptions)
        
        viewModel.$imageURL
            .receive(on: RunLoop.main)
            .sink { [weak self] in self?.mainView.thumbImageView.kf.setImage(with: $0) }
            .store(in: &subscriptions)
    }
}
