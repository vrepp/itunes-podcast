//
//  StringExtension.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 28.06.2022..
//

import Foundation

extension String {
    /// Localization
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "??\(self)??", comment: "")
    }
}
