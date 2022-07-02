//
//  ListViewController.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 27.06.2022..
//

import UIKit

final class ListViewController: UIViewController {
    
    weak var coordinator: ListCoordinator?
    private var viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.title
        view.backgroundColor = .red
    }
}
