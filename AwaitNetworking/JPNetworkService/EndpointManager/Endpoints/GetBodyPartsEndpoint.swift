//
//  GetBodyPartsEndpoint.swift
//  GetBodyPartsEndpoint
//
//  Created by Jatin on 22/09/21.
//

import Foundation

struct GetBodyPartsEndpoint: JPEndpoint {
    var path: String { "/constants/parts" }
    
    var httpMethod: HTTPMethod { .get }
    
    var httpBodyRaw: [String : String]? { nil }
    
    var urlParameters: JSONDictionary? { nil }
    
    func headers() throws -> [String : String] {
        try JPHttpHeaderBuilder.authHeaders.build()
    }   
}
