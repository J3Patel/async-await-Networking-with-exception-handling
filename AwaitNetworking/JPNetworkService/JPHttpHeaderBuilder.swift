//
//  JPHttpHeaderBuilder.swift
//  JPHttpHeaderBuilder
//
//  Created by Jatin on 22/09/21.
//

import Foundation

enum JPHttpHeaderBuilder {
    
    case defaultHeaders
    case authHeaders
    
    private enum Constant {
        enum KeyPaths {
            static let contentType = "Content-Type"
            static let accept = "Accept"
            static let client = "client"
            static let accessToken = "access-token"
            static let uid = "uid"
            
        }
        enum KeyPathValues {
            static let contentType = "application/json"
            static let accept = "application/vnd.docJPfit.com; version=1"
        }
    }
    
    func build() throws -> [String: String] {
        switch self {
        case .defaultHeaders: return defaultHeaders()
        case .authHeaders: return try authHeaders()
        }
    }
    
    private func defaultHeaders() -> [String: String] {
        [Constant.KeyPaths.contentType: Constant.KeyPathValues.contentType,
         Constant.KeyPaths.accept: Constant.KeyPathValues.accept]
    }
    
    // TODO: - get real data from storage
    private func authHeaders() throws -> [String: String] {
        // TODO: // throw error when data not available
        let headers = [Constant.KeyPaths.client: "skdE6QwsPg-_mrNUOLtGDA",
                       Constant.KeyPaths.accessToken: "AynSl0OqUgzdXlh6xX3rlA",
                       Constant.KeyPaths.uid: "8888781578"]
        return headers.merging(defaultHeaders()) { $1 }
    }
}
