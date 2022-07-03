//
//  PodcastDetailsViewModel.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 03.07.2022..
//

import Foundation

final class PodcastDetailsViewModel {
    
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

extension PodcastDetailsViewModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(podcast)
    }
}

extension PodcastDetailsViewModel: Equatable {
    
    static func == (lhs: PodcastDetailsViewModel, rhs: PodcastDetailsViewModel) -> Bool {
        return lhs.podcast == rhs.podcast
    }
}
