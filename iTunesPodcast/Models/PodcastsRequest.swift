//
//  PodcastRequest.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 29.07.2022..
//

import Foundation

struct PodcastsRequest: Encodable {
    let entity = "podcast"
    let term: String?
}
