//
//  Schema.__Field.swift
//  Gryphin
//
//  Created by Dima Bart on 2016-12-23.
//  Copyright © 2016 Dima Bart. All rights reserved.
//

import Foundation

extension __Schema {
    final class __Field: JsonCreatable, Describeable, Typeable {
        
        let name:              String
        let description:       String?
        let type:              __ObjectType
        let arguments:         [__Argument]
        let isDeprecated:      Bool
        let deprecationReason: String?
        
        // ----------------------------------
        //  MARK: - Init -
        //
        init(json: JSON) {
            self.name              = json["name"]                  as! String
            self.description       = json["description"]           as? String
            self.isDeprecated      = json["isDeprecated"]          as? Bool ?? false
            self.deprecationReason = json["deprecationReason"]     as? String
            self.type              = __ObjectType(json: json["type"] as! JSON)
            self.arguments         = __Argument.collectionWith(requiredJson: json["args"] as! [JSON])
        }
    }
}
