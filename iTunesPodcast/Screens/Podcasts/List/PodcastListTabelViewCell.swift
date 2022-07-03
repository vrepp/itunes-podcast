//
//  PodcastListTabelViewCell.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 02.07.2022..
//

import UIKit
import Kingfisher

final class PodcastListTabelViewCell: UITableViewCell {
    // MARK: Constants
    private struct Constants {
        static let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        static let stackViewSpacing: CGFloat = 20
        static let internalSpacing: CGFloat = 10
        static let thumbSize = CGSize(width: 100, height: 100)
        static let thumbCornerRadius: CGFloat = 4
    }
    
    // MARK: Properties
    private lazy var thumbImageView: UIImageView = {
        let imageView = UIImageView()
            .styleBackgroundColor(.systemGray5)
            .styleContentMode(.scaleAspectFit)
            .styleCornerRadius(cornerRadius: Constants.thumbCornerRadius)
            .styleMakeConstraints {
                $0.width.equalTo(Constants.thumbSize.width)
                $0.height.equalTo(Constants.thumbSize.height)
            }
        
        return imageView
    }()
    
    private lazy var artistNameLabel: UILabel = {
        let label = UILabel()
            .styleNumberOfLines(0)
            .styleFont(.preferredFont(forTextStyle: .headline))
            .styleTextColor(.label)
        
        return label
    }()
    
    private lazy var trackNameLabel: UILabel = {
        let label = UILabel()
            .styleNumberOfLines(0)
            .styleFont(.preferredFont(forTextStyle: .subheadline))
            .styleTextColor(.secondaryLabel)
                       
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbImageView.kf.cancelDownloadTask()
        thumbImageView.image = nil
    }
    
    // MARK: Setup
    private func setupUI() {
        let stackView = UIStackView()
            .styleAxis(.horizontal)
            .styleSpacing(Constants.stackViewSpacing)
            .styleAlignment(.top)
            .styleDistribution(.fill)
            .styleParentView(contentView)
            .styleMakeConstraints {
                $0.edges.equalTo(Constants.insets)
            }
        
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

extension PodcastListTabelViewCell {
    
    func bind(to viewModel: PodcastDetailsViewModel) {
        artistNameLabel.text = viewModel.artistName
        trackNameLabel.text = viewModel.trackName
        
        thumbImageView.kf.setImage(with: viewModel.imageURL)
    }
}
