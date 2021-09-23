//
//  SelfAssessmentsEndpoint.swift
//  SelfAssessmentsEndpoint
//
//  Created by Jatin on 22/09/21.
//

import Foundation

struct SelfAssessmentsEndpoint: JPEndpoint {
    var path: String { "/categories/self-assesments" }
    
    var httpMethod: HTTPMethod { .get }
    
    var httpBodyRaw: [String : String]? { nil }
    
    var urlParameters: JSONDictionary? { nil }
    
    func headers() throws -> [String : String] {
        try JPHttpHeaderBuilder.authHeaders.build()
    }   
}
