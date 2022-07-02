//
//  HttpClient.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 27.06.2022..
//

import Foundation

protocol HttpClientProvider: AnyObject {
    typealias HttpHeaders = [String: String]
    
    func performRequest<T: Decodable>(endpoint: HttpEndpoint<T>) async throws -> T
    
    var urlSession: URLSession { get }
    var httpHeaders: HttpHeaders? { get }
}

final class HttpClient: HttpClientProvider {
    let urlSession: URLSession
    let httpHeaders: HttpHeaders?
    
    init(urlSession: URLSession = .shared, httpHeaders: HttpHeaders? = nil) {
        self.urlSession = urlSession
        self.httpHeaders = httpHeaders
    }

    /// Perform HTTP request
    func performRequest<T>(endpoint: HttpEndpoint<T>) async throws -> T where T: Decodable {
        var urlRequest = try endpoint.urlRequest()
        urlRequest.allHTTPHeaderFields = httpHeaders
        
        let (data, response) = try await urlSession.data(for: urlRequest, delegate: nil)
        guard let response = response as? HTTPURLResponse else {
            throw HttpError.noResponse
        }
        
        switch response.statusCode {
            case 200...299:
                do {
                    let decodedResponse = try endpoint.decode(data)
                    return decodedResponse
                } catch {
                    throw HttpError.decode(error)
                }
            case 401:
                throw HttpError.unauthorized
            
            default:
                throw HttpError.unexpectedStatusCode(response.statusCode)
        }
    }
}
