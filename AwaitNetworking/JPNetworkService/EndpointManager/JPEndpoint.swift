//
//  JPEndpoint.swift
//  Endpoint
//
//  Created by Jatin on 22/09/21.
//

import Foundation

public typealias JSONDictionary = [String: Any]

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol JPEndpoint {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpBodyRaw: [String: String]? { get }
    var urlParameters: JSONDictionary? { get }
    func headers() throws -> [String: String]
}

extension JPEndpoint {
    var queryItems: [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        if let urlParameters = urlParameters {
            urlParameters.forEach({ (parameter) in
                queryItems.append(URLQueryItem(name: parameter.key, value: "\(parameter.value)"))
            })
        }
        return queryItems
    }
    
    var httpBody: Data? {
        get throws {
            guard let httpBodyRaw = httpBodyRaw else {
                return nil
            }
            do {
                return try JSONEncoder().encode(httpBodyRaw)
            } catch {
                throw URLError.invalidHttpBody
            }
            
        }
    }
}
