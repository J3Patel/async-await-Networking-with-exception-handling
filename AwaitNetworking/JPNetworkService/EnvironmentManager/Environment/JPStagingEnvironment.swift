//
//  JPStaging.swift
//  JPStaging
//
//  Created by Jatin on 22/09/21.
//

import Foundation

struct JPStaging: JPEnvironment {
    var defaultHeaders: [String : String] { [:] }
    
    var name: String {
        return "Staging"
    }
    
    var url: String {
        return "api-staging.JP.health"
    }
}
