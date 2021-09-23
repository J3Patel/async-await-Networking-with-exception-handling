//
//  JPEnvironmentManager.swift
//  JPEnvironmentManager
//
//  Created by Jatin on 22/09/21.
//

import Foundation

protocol EnvironmentManagerProtocol {
    static var current: JPEnvironment { get }
    func changeEnvironmet(to newEnvironment: JPEnvironmentFactory)
}

class JPEnvironmentManager: EnvironmentManagerProtocol {
    
    static var current: JPEnvironment {
        return shared.currentEnvironment
    }
    
    public static let shared = JPEnvironmentManager()
    private var currentEnvironment: JPEnvironment = JPStaging()
    
    func changeEnvironmet(to newEnvironment: JPEnvironmentFactory) {
        currentEnvironment = newEnvironment.build()
    }
    
}

