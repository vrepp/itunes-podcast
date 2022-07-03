//
//  PodcastViewModel.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 03.07.2022..
//

import Foundation

final class PodcastViewModel {
    
    @Published private(set) var title = "Details"
    @Published var artistName: String = ""
    @Published var trackName: String = ""
    
    private let podcast: Podcast
    
    init(podcast: Podcast) {
        self.podcast = podcast
        
        bind()
    }
    
    private func bind() {
        artistName = podcast.artistName
        trackName = podcast.trackName
    }
}

extension PodcastViewModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(podcast)
    }
}

extension PodcastViewModel: Equatable {
    
    static func == (lhs: PodcastViewModel, rhs: PodcastViewModel) -> Bool {
        return lhs.podcast == rhs.podcast
    }
}
