//
//  PodcastView.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 02.07.2022..
//

import UIKit

final class PodcastView: UIView {
    // MARK: Constants
    private struct Constants {
        static let stackViewSpacing: CGFloat = 20
    }
    
    // MARK: Properties
        
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
        
        
    }
}
