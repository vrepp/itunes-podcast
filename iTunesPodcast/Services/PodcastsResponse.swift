//
//  PodcastsResponse.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 29.07.2022..
//

import Foundation

struct PodcastsResponse: Decodable {
    let resultCount: Int
    let results: [Podcast]
}

/*
 {
     "resultCount": 9,
     "results": [
         {
             "trackId": 1585222927,
             "artistName": "Arati Menon, Food52, Heritage Radio Network",
             "trackName": "My Family Recipe",
             "trackCensoredName": "My Family Recipe",
             "artworkUrl100": "https://is4-ssl.mzstatic.com/image/thumb/Podcasts125/v4/21/89/fb/2189fb29-ba85-490f-1828-5cc6bdb4a4a3/mza_12170450223273407062.jpg/100x100bb.jpg",
             "releaseDate": "2021-12-17T12:00:00Z",
             ...
         },
         ...
     ]
 }
 */
