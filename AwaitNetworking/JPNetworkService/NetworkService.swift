//
//  NetworkService.swift
//  docJPfit
//
//  Created by Varun Varman on 20/06/21.
//

import Foundation
import Network

/*
 
 NetworkService Class:
 One of the core service Layer of the application,
 in this case use to provide the application with network API functionality,
 conforms to `NetworkServiceProtocol` for exposing functionality.
 
 */

import Foundation
public protocol NetworkServiceProtocol {
    func make(request: URLRequest) async throws -> Data
}

public final class NetworkService: NetworkServiceProtocol {
    
    // MARK: Private API's
    private let session: URLSession
    
    // MARK: Init
    public init (cacheCapacity: Int = 20*1024*1024) {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(memoryCapacity: cacheCapacity/4,
                                          diskCapacity: cacheCapacity)
        session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    // MARK: Public Methods
    public func make(request: URLRequest) async throws -> Data {
        
        let (data, response) = try await session.data(for: request)
        
        if let aResponse = response as? HTTPURLResponse,
           aResponse.statusCode != 200,
           aResponse.statusCode != 201 {
            switch aResponse.statusCode {
            case 404:
                throw NetworkError.notFound
            case 401, 400:
                throw NetworkError.badUnauthorisedRequest
            case 422, 100:
                throw NetworkError.validation
            case 500, 105:
                throw NetworkError.internalServer
            case 106, 111, 112, 114, 115, 116:
                throw NetworkError.badOperation
            default:
                throw NetworkError.undefined("Some Unknown Error Occurred")
            }
        }
        return data
    }
    
}
