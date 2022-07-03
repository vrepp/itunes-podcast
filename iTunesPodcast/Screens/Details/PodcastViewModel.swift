//
//  PodcastViewModel.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 03.07.2022..
//

import Foundation

final class PodcastViewModel {
    
    @Published private(set) var title = "podcast.details.title".localized()
    @Published private(set) var artistName: String
    @Published private(set) var trackName: String
    @Published private(set) var releaseDate: String
    @Published private(set) var imageURL: URL
    
    private let podcast: Podcast
    
    init(podcast: Podcast) {
        self.podcast = podcast
        
        artistName = podcast.artistName
        trackName = podcast.trackName
        releaseDate = podcast.releaseDate.string(with: .longDate)
        imageURL = podcast.artworkUrl100
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
