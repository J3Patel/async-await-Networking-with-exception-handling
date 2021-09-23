//
//  BodyPart.swift
//  docJPfit
//
//  Created by Varun Varman on 27/07/21.
//

import Foundation
class BodyParts: DataModel {
    var parts: [BodyPart] = []
    
    enum CodingKeys: CodingKey {
        case response
        //
        enum ResponseCodingKeys: CodingKey {
            case data
        }
    }
    
    required init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        let response = try! values!.nestedContainer(keyedBy: CodingKeys.ResponseCodingKeys.self, forKey: CodingKeys.response)
        var dataUnkeyedContainer = try! response.nestedUnkeyedContainer(forKey: CodingKeys.ResponseCodingKeys.data)
        while !dataUnkeyedContainer.isAtEnd {
            let part = try! dataUnkeyedContainer.decode(BodyPart.self)
            self.parts.append(part)
        }
    }
}

class BodyPart: DataModel {
    var identifier: String?
    var type: String?
    var name: String?
    //
    var isSelected: Bool = false
    
    enum CodingKeys: CodingKey {
        case id
        case type
        case attributes
        //
        enum AttributeCodingKeys: CodingKey {
            case name
        }
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let attributesContainer = try? values.nestedContainer(keyedBy: CodingKeys.AttributeCodingKeys.self,
                                                               forKey: CodingKeys.attributes)
        
        self.identifier = try values.decode(String.self, forKey: CodingKeys.id)
        self.type = try? values.decode(String.self, forKey: CodingKeys.type)
        self.name = try? attributesContainer?.decode(String.self, forKey: CodingKeys.AttributeCodingKeys.name)
    }
}
