//
//  ListViewModel.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 28.06.2022..
//

import Foundation
import Combine

final class ListViewModel {
    enum ListViewState {
        case loading
        case finished
        case failed(Error)
    }
    
    @Published var searchQuery: String = ""
    
    @Published private(set) var title = "Podcast list"
    @Published private(set) var state: ListViewState = .loading
    @Published private(set) var podcastViewModels: [PodcastViewModel] = []
    
    let service: PodcastsServiceProtocol
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init(service: PodcastsServiceProtocol = PodcastsService()) {
        self.service = service
        
        bind()
    }
    
    private func bind() {
        $searchQuery
            .receive(on: RunLoop.main)
            .debounce(for: .seconds(0.3), scheduler: RunLoop.main)
            .sink { [weak self] in self?.fetchPodcasts($0) }
            .store(in: &subscriptions)
    }
    
    private func fetchPodcasts(_ searchQuery: String) {
        state = .loading
        
        service.fetch(searchTerm: searchQuery)
            .sink(receiveCompletion: { [weak self] completition in                
                switch completition {
                    case .finished:
                        self?.state = .finished
                    case .failure(let error):
                        self?.state = .failed(error)
                }
            }, receiveValue: { [weak self] in self?.podcastViewModels = $0.map { PodcastViewModel(podcast: $0) } })
            .store(in: &subscriptions)
    }
}
