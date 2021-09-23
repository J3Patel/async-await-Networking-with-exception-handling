//
//  NetworkError.swift
//  NetworkError
//
//  Created by Jatin on 22/09/21.
//

import Foundation

public enum NetworkError: JenError {
    case none
    case notFound
    case badUnauthorisedRequest
    case validation
    case internalServer
    case badOperation
    case noConnection
    case undefined(String)
    case noInternetConnection
    
    public var rawValue: String {
        switch self {
            case .none:
                return "No Network Error"
            case .notFound:
                return "Data Not found, Please try again Later"
            case .badUnauthorisedRequest:
                return "Incorrect Request Params or params do not match, Try again with correct params."
            case .validation:
                return "There was an error in validation, Try again later" // api_key not valid, etc.
            case .internalServer:
                return "Server seems to be busy try again in some time."
            case .undefined(let description):
                return "There was an Error: \(description)"
            case .noConnection:
                return "You are not connected to the internet please verify you connection."
            case .badOperation:
                return "A bad operation occurred..."
            case .noInternetConnection:
            return "No active internet connection"
        }
    }
}
