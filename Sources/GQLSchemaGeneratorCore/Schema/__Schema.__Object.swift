//
//  __Object.swift
//  Gryphin
//
//  Created by Dima Bart on 2016-12-23.
//  Copyright © 2016 Dima Bart. All rights reserved.
//

import Foundation

extension __Schema {
    class __Object: JsonCreatable, Describeable {
        
        let kind:          __Kind
        let name:          String
        let description:   String?
        let fields:        [__Field]?
        let inputFields:   [__InputField]?
        let interfaces:    [__ObjectType]?
        let enumValues:    [__EnumValue]?
        let possibleTypes: [__ObjectType]?
        
        var edgesField: __Field? {
            return self.field(named: "edges")
        }
        
        var nodeField: __Field? {
            return self.field(named: "node")
        }
        
        // ----------------------------------
        //  MARK: - Init -
        //
        required init(json: JSON) {
            self.kind          = __Kind(string: json["kind"] as! String)!
            self.name          = json["name"]              as! String
            self.description   = json["description"]       as? String
            
            self.fields        = __Field.collectionWith(optionalJson:      json["fields"]        as? [JSON])
            self.inputFields   = __InputField.collectionWith(optionalJson: json["inputFields"]   as? [JSON])
            self.interfaces    = __ObjectType.collectionWith(optionalJson: json["interfaces"]    as? [JSON])
            self.enumValues    = __EnumValue.collectionWith(optionalJson:  json["enumValues"]    as? [JSON])
            self.possibleTypes = __ObjectType.collectionWith(optionalJson: json["possibleTypes"] as? [JSON])
        }
        
        // ----------------------------------
        //  MARK: - Field Queries -
        //
        private func field(named name: String) -> __Field? {
            guard let fields = self.fields else {
                return nil
            }
            
            for field in fields {
                if field.name == name {
                    return field
                }
            }
            
            return nil
        }
    }
}
