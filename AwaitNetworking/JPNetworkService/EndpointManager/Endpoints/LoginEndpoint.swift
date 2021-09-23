//
//  LoginEndpoint.swift
//  LoginEndpoint
//
//  Created by Jatin on 22/09/21.
//

import Foundation

struct LoginEndpoint: JPEndpoint {
    
    enum KeyPaths {
        static let mobile = "mobile"
        static let countryCode = "country_code"
    }
    
    let mobileNumber: String
    let countryCode: String
    
    var path: String { "/auth" }
    
    var httpMethod: HTTPMethod { .post }
    
    var httpBodyRaw: [String : String]? {
        [KeyPaths.mobile: mobileNumber,
         KeyPaths.countryCode: countryCode]
    }
    
    var urlParameters: JSONDictionary? {
        nil
    }
    
    func headers() throws -> [String : String] {
        try JPHttpHeaderBuilder.defaultHeaders.build()
    }
}
