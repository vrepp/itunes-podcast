//
//  PodcastsService.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 01.07.2022..
//

import Foundation
import Combine

protocol PodcastsServiceProtocol {
    func fetch(searchTerm: String?) -> AnyPublisher<[Podcast], Error>
}

struct PodcastsService: PodcastsServiceProtocol {
    let client: HttpClientProvider
    
    init(client: HttpClientProvider = HttpClient()) {
        self.client = client
    }
    
    func fetch(searchTerm: String?) -> AnyPublisher<[Podcast], Error> {
        let request = PodcastsRequest(term: searchTerm)
        let endpoint = API.getPodcasts(request)
        
        return Deferred {
            Future { promise in
                Task {
                    do {
                        let response = try await client.performRequest(endpoint: endpoint)
                        promise(.success(response.results))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
