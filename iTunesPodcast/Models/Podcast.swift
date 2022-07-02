//
//  Podcast.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 28.06.2022..
//

import Foundation

struct Podcast: Decodable {
    let trackId: Int
    let artistName: String
    let trackName: String
    let trackCensoredName: String
    let artworkUrl100: URL
    let releaseDate: Date
}
