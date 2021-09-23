//
//  NetworkManager.swift
//  docJPfit
//
//  Created by Varun Varman on 20/06/21.
//

import Foundation

/*
 
 NetworkManager Class:
 Consumes the core service level functionality,
 and exposed end-point APIs for the front-facing user/developer to consume.
 
 */

protocol NetworkManagerProtocol {
    var requestBuilder: JPRequestBuilderProtocol { get }
    func fetch<T: DataModel>(from endpoint: JPEndpointFactory) async throws -> T
}

final class NetworkManager: NetworkManagerProtocol {
    
    // MARK: - Private APIs
    private let networkService: NetworkServiceProtocol!
    
    // MARK: - Shared Instance
    static let shared = NetworkManager()
    
    // MARK: - Initialisation
    private init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    internal var requestBuilder: JPRequestBuilderProtocol {
        let current = JPEnvironmentManager.current
        return JPRequestBuilder(environment: current)
    }
    
    // MARK: Public Methods
    public func fetch<T: DataModel>(from endpoint: JPEndpointFactory) async throws -> T {
        let request = try requestBuilder.build(with: endpoint.build())
        let data = try await networkService.make(request: request)
        let dataModel = try DataModeller<JPDataResponse<T>>().parse(from: data)
        
        if case let .error(error) = dataModel {
            throw DataModelError.errorResponse(error.errorCode)
        }
        
        guard case let .data(model) = dataModel else {
            throw DataModelError.badJSON
        }
        return model
    }
}

public protocol TaskHandler {
    func end()
}

extension URLSessionTask: TaskHandler {
    public func end() {
        self.cancel()
    }
}
