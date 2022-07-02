//
//  Configuration.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 28.07.2022..
//

import Foundation

extension HttpBaseUrl {
    /// Default baseUrl value
    static var `default`: Self {
        HttpBaseUrl(rawValue: "https://itunes.apple.com")
    }
}
