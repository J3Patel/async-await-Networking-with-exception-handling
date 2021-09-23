//
//  RefreshEndpoint.swift
//  RefreshEndpoint
//
//  Created by Jatin on 22/09/21.
//

import Foundation

struct RefreshEndpoint: JPEndpoint {
    var path: String {"/auth/refresh"}
    
    var httpMethod: HTTPMethod {.post}
    
    var httpBodyRaw: [String : String]? { nil }
    
    var urlParameters: JSONDictionary?
    
    func headers() throws -> [String : String] {
        try JPHttpHeaderBuilder.defaultHeaders.build()
    }
}
