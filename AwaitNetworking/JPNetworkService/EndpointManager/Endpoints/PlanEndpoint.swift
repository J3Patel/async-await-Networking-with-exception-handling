//
//  PlanEndpoint.swift
//  PlanEndpoint
//
//  Created by Jatin on 22/09/21.
//

import Foundation

struct PlanEndpoint: JPEndpoint {
    
    let planID: String
    
    var path: String { "plans/\(planID)" }
    
    var httpMethod: HTTPMethod { .get }
    
    var httpBodyRaw: [String : String]? { nil }
    
    var urlParameters: JSONDictionary? { nil }
    
    func headers() throws -> [String : String] {
        try JPHttpHeaderBuilder.authHeaders.build()
    }
}
