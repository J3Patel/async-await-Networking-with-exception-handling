//
//  JPAPIService.swift
//  JPAPIService
//
//  Created by Jatin on 22/09/21.
//

import Foundation

// Responsible for handling exceptions and creating view models.

protocol JPAPIService {
    var networkManager: NetworkManager { get }
}

extension JPAPIService {
    var networkManager: NetworkManager {
        NetworkManager.shared
    }
}
