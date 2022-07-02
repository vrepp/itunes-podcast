//
//  HttpError.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 27.06.2022..
//

import Foundation

enum HttpError: LocalizedError {
    case invalidURL(String)
    case decode(Error)
    case noResponse
    case unauthorized
    case unexpectedStatusCode(Int)
    case unknown
    
    var errorDescription: String? {
        switch self {
            case .invalidURL(let url):
                return "Invalid URL: \(url)"
            
            case .decode(let error):
                return "Decode error: \(error.localizedDescription)"
            
            case .noResponse:
                return "No response from server"
                
            case .unauthorized:
                return "Session expired"
            
            case .unexpectedStatusCode(let statusCode):
                return "Unexpected status code: \(statusCode)"
            
            default:
                return "Unknown error"
        }
    }
}
