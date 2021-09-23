//
//  JPDataModel.swift
//  JPDataModel
//
//  Created by Jatin on 22/09/21.
//

import Foundation

protocol DataModel: Decodable { }

extension Array: DataModel where Element: Decodable { }
