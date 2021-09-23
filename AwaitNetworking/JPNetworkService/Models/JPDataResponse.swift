//
//  JPDataResponse.swift
//  JPDataResponse
//
//  Created by Jatin on 22/09/21.
//

import Foundation

enum JPDataResponse<T: DataModel>: Decodable {
    case data(data: T)
    case error(error: JPResponseError)
    
    private enum CodingKeys: String, CodingKey {
        
        case response
        enum ResponseCodingKeys: CodingKey {
            case data
            case error
        }
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let response = try values.nestedContainer(keyedBy: CodingKeys.ResponseCodingKeys.self,
                                                  forKey: CodingKeys.response)
        
        
        if let value = try? response.decode(T.self,
                                          forKey: CodingKeys.ResponseCodingKeys.data) {
            self = .data(data: value)
            return
        }
        
        if let value = try? response.decode(JPResponseError.self,
                                          forKey: CodingKeys.ResponseCodingKeys.data) {
            self = .error(error: value)
            return
        }
        throw NetworkError.badOperation//PostTypeCodingError.decoding("Whoops! \(dump(values))")
    }
    
    
}
