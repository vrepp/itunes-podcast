//
//  PodcastsAPI.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 29.07.2022..
//

import Foundation

extension API {
    /// Fetch Podcasts by Search term
    static func getPodcasts(_ request: PodcastsRequest) -> HttpEndpoint<PodcastsResponse> {
        return HttpEndpoint(
            method: .get,
            baseUrl: .default,
            path: "search",
            parameters: request
        )
    }
}
