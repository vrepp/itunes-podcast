//
//  ListTabelViewCell.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 02.07.2022..
//

import UIKit
import Combine

final class ListTabelViewCell: UITableViewCell {
    // MARK: Constants
    private struct Constants {
        static let stackViewSpacing: CGFloat = 20
        static let internalSpacing: CGFloat = 10
        static let thumbSize = CGSize(width: 100, height: 100)
    }
    
    // MARK: Properties
    private var subscriptions: Set<AnyCancellable> = []
    
    private lazy var thumbImageView: UIImageView = {
        let imageView = UIImageView()
            .styleContentMode(.scaleAspectFit)
            .styleCornerRadius(cornerRadius: 2)
            .styleMakeConstraints {
                $0.width.equalTo(Constants.thumbSize.width)
                $0.height.equalTo(Constants.thumbSize.height)
            }
        
        return imageView
    }()
    
    private lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    // MARK: UITableViewCell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: Setup
    private func setupUI() {
        let stackView = UIStackView()
            .styleAxis(.horizontal)
            .styleSpacing(Constants.stackViewSpacing)
            .styleAlignment(.top)
            .styleDistribution(.fill)
            .styleParentView(contentView)
            .styleMakeConstraints { $0.edges.equalToSuperview() }
        
        thumbImageView
            .styleParentView(stackView)
        
        UIStackView(arrangedSubviews: [artistNameLabel, trackNameLabel])
            .styleAxis(.vertical)
            .styleSpacing(Constants.internalSpacing)
            .styleAlignment(.leading)
            .styleDistribution(.fill)
            .styleParentView(stackView)
    }
}

extension ListTabelViewCell {
    
    func bind(to viewModel: PodcastViewModel) {
        artistNameLabel.text = viewModel.artistName
        trackNameLabel.text = viewModel.trackName
    }
}
