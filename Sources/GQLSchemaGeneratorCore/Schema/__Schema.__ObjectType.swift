//
//  Schema.__ObjectType.swift
//  Gryphin
//
//  Created by Dima Bart on 2016-12-24.
//  Copyright © 2016 Dima Bart. All rights reserved.
//

import Foundation

extension __Schema {
    final class __ObjectType: JsonCreatable, Nameable {
        
        let kind:         __Kind
        let possibleName: String?
        let ofType:       __ObjectType?
        
        var name: String {
            return self.possibleName!
        }
        
        var hasScalar: Bool {
            if let type = self.ofType {
                return type.hasScalar
            }
            return self.kind == .scalar || self.kind == .enum
        }
        
        var isAbstract: Bool {
            if let type = self.ofType {
                return type.isAbstract
            }
            return self.kind == .interface || self.kind == .union
        }
        
        var isCollection: Bool {
            guard self.kind != .list else {
                return true
            }
            
            if let type = self.ofType {
                return type.isCollection
            }
            
            return false
        }
        
        var isTopLevelNullable: Bool {
            return self.kind != .nonNull
        }
        
        var isLeafNullable: Bool {
            return self.leaf.parentType?.isTopLevelNullable ?? self.isTopLevelNullable
        }
        
        var leaf: __ObjectType {
            if let type = self.ofType {
                return type.leaf
            }
            return self
        }
        
        private let parentType: __ObjectType?
        
        // ----------------------------------
        //  MARK: - Init -
        //
        init(json: JSON) {
            self.kind         = __Kind(string: json["kind"]       as! String)!
            self.possibleName = json["name"]                    as? String
            self.ofType       = __ObjectType(json: json["ofType"] as? JSON)
            self.parentType   = nil
            
            self.ofType?.parentType = self
        }
    }
}
