//
//  JPEnvironmentFactory.swift
//  JPEnvironmentFactory
//
//  Created by Jatin on 22/09/21.
//

import Foundation

enum JPEnvironmentFactory: Int {
    case staging
    
    func build() -> JPEnvironment {
        switch self {
        case .staging:
            return JPStaging()
        }
    }
}
