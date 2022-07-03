//
//  Date+Extension.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 03.07.2022..
//

import Foundation

extension Date {
    /// Return Formatted Date as String 
    func string(with dateFormatter: DateFormatter) -> String {
        return dateFormatter.string(from: self)
    }
}
