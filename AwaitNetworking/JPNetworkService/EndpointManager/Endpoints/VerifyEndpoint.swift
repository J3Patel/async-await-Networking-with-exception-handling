//
//  VerifyEndpoint.swift
//  VerifyEndpoint
//
//  Created by Jatin on 22/09/21.
//

import Foundation

struct VerifyEndpoint: JPEndpoint {
    enum KeyPaths {
        static let mobile = "mobile"
        static let countryCode = "country_code"
        static let otp = "otp"
    }
    
    let otp: String
    let mobileNumber: String
    let countryCode: String
    
    var path: String { "/auth" }
    
    var httpMethod: HTTPMethod {.post}
    
    var httpBodyRaw: [String : String]? {
        [KeyPaths.mobile: mobileNumber,
         KeyPaths.countryCode: countryCode,
         KeyPaths.otp: otp]
    }
    
    var urlParameters: JSONDictionary? {
        nil
    }
    
    func headers() throws -> [String : String] {
        try JPHttpHeaderBuilder.defaultHeaders.build()
    }
}
