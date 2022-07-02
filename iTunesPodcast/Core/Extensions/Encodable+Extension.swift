//
//  EncodableExtension.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 28.06.2022..
//

import Foundation

extension Encodable {
    /// return as Dictionary
    func asDictionary() -> [String: Any]? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = .iso8601
        guard let data = try? jsonEncoder.encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    /// return as QueryItems
    func asQueryItems() -> [URLQueryItem]? {
        let parameters = self.asDictionary() ?? [:]
        
        return query(parameters).compactMap { (name, value) in
            URLQueryItem(name: name, value: value)
        }
    }
    
    private func query(_ parameters: [String: Any]) -> [(String, String)] {
        var components: [(String, String)] = []

        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]!
            components += queryComponents(fromKey: key, value: value)
        }
        
        return components
    }
    
    private func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
        var components: [(String, String)] = []
        switch value {
        case let dictionary as [String: Any]:
            for (nestedKey, value) in dictionary {
                components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
            }
        case let array as [Any]:
            for value in array {
                components += queryComponents(fromKey: "\(key)[]", value: value)
            }
        case let number as NSNumber:
            if number.isBool {
                components.append((escape(key), escape(number.boolValue ? "1": "0")))
            } else {
                components.append((escape(key), escape("\(number)")))
            }
        case let bool as Bool:
                components.append((escape(key), escape(bool ? "1" : "0")))
        default:
            components.append((escape(key), escape("\(value)")))
        }
        
        return components
    }
    
    private func escape(_ string: String) -> String {
        string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? string
    }
}

extension NSNumber {
    /// Check if NSNumber is Bool
    fileprivate var isBool: Bool {
        // Use Obj-C type encoding to check whether the underlying type is a `Bool`, as it's guaranteed as part of
        // swift-corelibs-foundation, per [this discussion on the Swift forums](https://forums.swift.org/t/alamofire-on-linux-possible-but-not-release-ready/34553/22).
        String(cString: objCType) == "c"
    }
}
