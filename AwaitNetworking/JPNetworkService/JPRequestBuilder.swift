//
//  RequestBuilder.swift
//  RequestBuilder
//
//  Created by Jatin on 22/09/21.
//

import Foundation

protocol JPRequestBuilderProtocol {
    func build(with endpoint: JPEndpoint) throws -> URLRequest
}

struct JPRequestBuilder: JPRequestBuilderProtocol {
    
    let environment: JPEnvironment
    
    func build(with endPoint: JPEndpoint) throws -> URLRequest {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = environment.url
        components.path = endPoint.path
        components.queryItems = endPoint.queryItems
        
        guard let url = components.url else {
            throw URLError.invalidRequestData
        }

        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = endPoint.httpMethod.rawValue
        
        request.allHTTPHeaderFields = try endPoint.headers()
        request.httpBody = try endPoint.httpBody

        return request
    }
    
}
