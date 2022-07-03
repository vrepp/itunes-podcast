//
//  PodcastListViewController.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 27.06.2022..
//

import UIKit
import Combine

protocol PodcastListViewControllerCoordinatable: AnyObject {
    func coordinateShowDetails(with modelView: PodcastDetailsViewModel)
}

final class PodcastListViewController: UIViewController, MainViewCustomizable {
    // MARK: MainViewCustomizable
    typealias MainView = PodcastListView
    
    typealias DataSource = UITableViewDiffableDataSource<Int, PodcastDetailsViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, PodcastDetailsViewModel>
    
    weak var coordinator: PodcastListViewControllerCoordinatable?
    private var dataSource: DataSource!
    
    private var viewModel: PodcastListViewModel
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: UIViewController Lifecycle
    init(viewModel: PodcastListViewModel) {
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
        
        configureDataSource()
        bindInput()
        bindOutput()
    }
    
    // MARK: DataSource
    private func configureDataSource() {
        dataSource = DataSource(tableView: mainView.tableView, cellProvider: { tableView, indexPath, modelView -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(with: PodcastListTabelViewCell.self, for: indexPath)
            cell.bind(to: modelView)
            return cell
        })
    }
    
    // MARK: Binding
    private func bindInput() {
        mainView.searchBar.delegate = self
        mainView.tableView.delegate = self
    }
    
    private func bindOutput() {
        viewModel.$title
            .receive(on: RunLoop.main)
            .sink { [weak self] in self?.navigationItem.title = $0 }
            .store(in: &subscriptions)
        
        viewModel.$podcastViewModels
            .receive(on: RunLoop.main)
            .sink { [weak self] viewModels in
                var snapshot = Snapshot()
                snapshot.appendSections([0])
                snapshot.appendItems(viewModels)
                self?.dataSource.applySnapshotUsingReloadData(snapshot)
            }
            .store(in: &subscriptions)
        
        viewModel.$state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                switch state {
                    case .loading:
                        self?.mainView.activityIndicationView.startAnimating()
                    case .finished:
                        self?.mainView.activityIndicationView.stopAnimating()
                    case .failed(let error):
                        self?.mainView.activityIndicationView.stopAnimating()
                        self?.showError(error)
                }
            }
            .store(in: &subscriptions)
    }
}

// MARK: - UISearchBarDelegate
extension PodcastListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchQuery = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchQuery = ""
    }
}

// MARK: - UITableViewDelegate
extension PodcastListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snapshot = dataSource.snapshot()
        let viewModel = snapshot.itemIdentifiers[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        coordinator?.coordinateShowDetails(with: viewModel)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        mainView.searchBar.resignFirstResponder()
    }
}
