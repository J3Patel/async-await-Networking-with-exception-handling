//
//  DataModelError.swift
//  DataModelError
//
//  Created by Jatin on 22/09/21.
//

import Foundation

public enum DataModelError: JPError {
    case errorResponse(String)
    case badJSON
}
