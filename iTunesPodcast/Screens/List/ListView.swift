//
//  ListView.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 02.07.2022..
//

import UIKit

final class ListView: UIView {
    // MARK: Constants
    private struct Constants {
        static let stackViewSpacing: CGFloat = 20
    }
    
    // MARK: Properties
    private(set) lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        return searchBar
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellType: ListTabelViewCell.self)
        tableView.tableFooterView = UIView()
        
        return tableView
    }()
    
    private(set) lazy var activityIndicationView = UIActivityIndicatorView(style: .large)
    
    // MARK: - UIView Lifecycle
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    @available(*, unavailable)
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func setupUI() {
        backgroundColor = .systemBackground
        
        searchBar
            .styleParentView(self)
            .styleMakeConstraints {
                $0.top.equalTo(safeAreaLayoutGuide.snp.top)
                $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            }
        
        tableView
            .styleParentView(self)
            .styleMakeConstraints {
                $0.top.equalTo(searchBar.snp.bottom)
                $0.leading.trailing.equalTo(safeAreaLayoutGuide)
                $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            }
        
        activityIndicationView
            .styleParentView(self)
            .styleMakeConstraints { $0.center.equalToSuperview() }
    }
}
