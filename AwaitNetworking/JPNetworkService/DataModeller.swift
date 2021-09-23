//
//  DataModeller.swift
//  docJPfit
//
//  Created by Varun Varman on 20/06/21.
//

import Foundation

/*
 
 DataModeller Class:
 The Modeller class used to prepare the appropriate data models,
 utilises Generics with the appropriate protocol implementation.
 
 */

public protocol ModellerProtocol {
    associatedtype TypeExpression: Decodable
    func parse(from data: Data) throws -> TypeExpression
}

public final class DataModeller<T: Decodable>: ModellerProtocol {
    
    // MARK: - Private APIs
    private var decoder: JSONDecoder!
    
    // MARK: - Initialisation
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    public func parse(from data: Data) throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw ParserError.jsonDecodingError("Some error occurred. Unable to decode: \(error.localizedDescription)")
        }
    }
}

// MARK: Parser Errors
public enum ParserError: Error {
    case jsonDecodingError(String?)
    case jsonEncodingError(String?)
    case undefined(String?)
    
    var rawValue: String {
        switch self {
        case .jsonDecodingError(let msg):
            return msg ?? "Parser Encoding Error"
        case .jsonEncodingError(let msg):
            return msg ?? "Parser Decoding Error"
        case .undefined(let msg):
            return msg ?? "parsing Error"
        }
    }
}

extension CodingUserInfoKey {
    static let backgroundManagedObjectContext = CodingUserInfoKey(rawValue: "backgroundManagedObjectContext")!
}
