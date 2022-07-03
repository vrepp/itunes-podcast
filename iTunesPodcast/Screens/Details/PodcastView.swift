//
//  PodcastView.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 02.07.2022..
//

import UIKit
import Kingfisher

final class PodcastView: UIView {
    // MARK: Constants
    private struct Constants {
        static let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        static let stackViewSpacing: CGFloat = 20
        static let internalSpacing: CGFloat = 10
        static let thumbSize = CGSize(width: 100, height: 100)
        static let thumbCornerRadius: CGFloat = 4
    }
    
    // MARK: Properties
    private(set) lazy var thumbImageView: UIImageView = {
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
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
            .styleNumberOfLines(0)
            .styleFont(.preferredFont(forTextStyle: .headline))
            .styleTextColor(.label)
        
        return label
    }()
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
            .styleNumberOfLines(0)
            .styleFont(.preferredFont(forTextStyle: .subheadline))
            .styleTextColor(.label)
                       
        return label
    }()
    
    private(set) lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
            .styleNumberOfLines(0)
            .styleFont(.preferredFont(forTextStyle: .subheadline))
            .styleTextColor(.darkGray)
                       
        return label
    }()
        
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
        
        let stackView = UIStackView()
            .styleAxis(.vertical)
            .styleSpacing(Constants.stackViewSpacing)
            .styleAlignment(.fill)
            .styleDistribution(.fill)
            .styleParentView(self)
            .styleMakeConstraints {
                $0.edges.equalTo(safeAreaLayoutGuide).inset(Constants.insets)
            }
        
        UIStackView(arrangedSubviews: [thumbImageView])
            .styleAxis(.vertical)
            .styleSpacing(Constants.internalSpacing)
            .styleAlignment(.center)
            .styleDistribution(.fill)
            .styleParentView(stackView)
        
        UIStackView(arrangedSubviews: [artistNameLabel, trackNameLabel, releaseDateLabel, UIView()])
            .styleAxis(.vertical)
            .styleSpacing(Constants.internalSpacing)
            .styleAlignment(.leading)
            .styleDistribution(.fill)
            .styleParentView(stackView)
    }
}
