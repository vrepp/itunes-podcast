//
//  ListViewModel.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 28.06.2022..
//

import Foundation

final class ListViewModel {
    
    @Published private(set) var title = "Podcast list"
    
    let service: PodcastsServiceProtocol
    
    init(service: PodcastsServiceProtocol = PodcastsService()) {
        self.service = service
    }
    
 
}
