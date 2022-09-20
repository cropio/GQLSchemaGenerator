//
//  Swift.Generator.swift
//  Gryphin
//
//  Created by Dima Bart on 2016-12-28.
//  Copyright © 2016 Dima Bart. All rights reserved.
//

import Foundation

extension Swift {
    final class Generator {
        
        enum GeneratorError: Error {
            case invalidFormat
            case unableToOpenSchema
        }
        
        struct File {
            
            enum Kind: String {
                case aliases
                case enums
                case rootQueries
                case queries
                case models
                case inputs
                case network
                case fragments
            }
            
            var kind:      Kind
            var container: Container
            
            var fileName: String {
                return "Gen$\(self.kind.rawValue).swift"
            }
            
            func url(relativeTo url: URL) -> URL {
                return url.appendingPathComponent(self.fileName)
            }
        }
        
        let schemaJSON:    JSON
        let configuration: Configuration
        
        private var standardScalars: Set<String> = [
            "Int",
            "Boolean",
            "Float",
            "String",
            "URL",
            "Date",
            
            // "ID",
            
            /* -----------------------
             ** We don't include ID
             ** as the standard scalar
             ** because we still need a
             ** type definition for it.
             */
        ]
        
        private var customScalarTypes: [String: String] = [:]
        
        private struct SchemaKey {
            static let data             = "data"
            static let schema           = "__schema"
            static let types            = "types"
            static let directives       = "directives"
            static let queryType        = "queryType"
            static let mutationType     = "mutationType"
            static let subscriptionType = "subscriptionType"
        }
        
        // ----------------------------------
        //  MARK: - Init -
        //
        init(withSchema schema: JSON, configuration: Configuration) {
            self.schemaJSON    = schema
            self.configuration = configuration
            
            /* ------------------------------------
             ** Insert scalar names into the ignore
             ** set if they have a source file. Any
             ** scalars that are aliases will still
             ** need generated typealias definitions.
             */
            configuration.scalarDescriptions?.forEach {
                switch $0.source {
                case .file:
                    self.standardScalars.insert($0.name)
                case .aliasFor(let type):
                    self.customScalarTypes[$0.name] = type
                }
            }
        }
        
        convenience init(withSchemaData data: Data, configuration: Configuration) throws {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let schemaJSON = json as? JSON else {
                throw GeneratorError.invalidFormat
            }
            
            self.init(withSchema: schemaJSON, configuration: configuration)
        }
        
        convenience init(withSchemaAt url: URL, configuration: Configuration) throws {
            guard let data = try? Data(contentsOf: url) else {
                throw GeneratorError.unableToOpenSchema
            }
            try self.init(withSchemaData: data, configuration: configuration)
        }
        
        // ----------------------------------
        //  MARK: - Generation -
        //
        func generate() -> [File] {
            
            let schemaData     = self.schemaJSON[SchemaKey.data] as! JSON
            let jsonSchema     = schemaData[SchemaKey.schema]    as! JSON
            let jsonTypes      = jsonSchema[SchemaKey.types]     as! [JSON]
            
            let queryType      = TypeName(name: (jsonSchema[SchemaKey.queryType]    as? JSON)?["name"] as? String)
            let mutationType   = TypeName(name: (jsonSchema[SchemaKey.mutationType] as? JSON)?["name"] as? String)
            
            let foundationModule = Swift.Import(module: "Foundation")
            let schemaModule = Swift.Import(module: "GQLSchema")

            let aliasesFile = File(kind: .aliases, container: Container(children: foundationModule, schemaModule))
            let enumsFile   = File(kind: .enums,   container: Container(children: foundationModule, schemaModule))
            let rootQueriesFile = File(kind: .rootQueries, container: Container(children: foundationModule, schemaModule))
            let queriesFile = File(kind: .queries, container: Container(children: foundationModule, schemaModule))
//            let modelsFile  = File(kind: .models,  container: Container(children: foundationModule))
            let inputsFile  = File(kind: .inputs,  container: Container(children: foundationModule, schemaModule))
//            let networkFile = File(kind: .network, container: Container(children: foundationModule))
            let fragmentsFile = File(kind: .fragments, container: Container(children: foundationModule, schemaModule))

            
            /* -----------------------------
             ** Parse the schema types first
             */
            var types = jsonTypes.map {
                __Schema.__Object(json: $0)
            }
            
            let generatedTypes = types.keyedUsing { $0.name }
            
            types.sort { lhs, rhs in
                lhs.kind.rawValue < rhs.kind.rawValue
            }
            
            for type in types where !type.name.hasPrefix("__") {
                
                /* -----------------------------------------
                 ** Generate the appropriate source for each
                 ** type declared in the schema.
                 */
                switch type.kind {
                case .object:
                    
                    /* ---------------------------------
                     ** Specific logic for root Query
                     ** and Mutation types.
                     */
                    
                    if let queryType = queryType, queryType.name == type.name {
                        rootQueriesFile.container += self.generate(object: type, rootType: "GraphQLQuery")
                        
                    } else if let mutationType = mutationType, mutationType.name == type.name {
                        rootQueriesFile.container += self.generate(object: type, rootType: "GraphQLMutation")
                    } else {
                        queriesFile.container += self.generate(object: type, rootType: nil)
                        fragmentsFile.container += self.genereteFragment(objectModel: type)
                    }
                    
//                    modelsFile.container  += self.generate(objectModel: type, parsedTypes: generatedTypes)
                    
                case .interface:
                    queriesFile.container += self.generate(interface: type, parsedTypes: generatedTypes)
                    queriesFile.container += self.generate(concreteInterface: type)
                    
                    // TODO: generate(interfaceModel: type)
//                    modelsFile.container += self.generate(concreteInterfaceModel: type)
                    
                case .enum:
                    enumsFile.container += self.generate(enum: type)
                    
                case .inputObject:
                    inputsFile.container += self.generate(inputObject: type)
                    
                case .scalar:
                    if let alias = self.generate(scalar: type.name) {
                        aliasesFile.container += alias
                    }
                    
                case .union:
                    queriesFile.container += self.generate(union: type)
                    queriesFile.container += self.generate(concreteInterface: type)
                    
//                    modelsFile.container  += self.generate(concreteInterfaceModel: type)
                    
                case .list:
                    break
                case .nonNull:
                    break
                }
            }
            
            /* ----------------------------------------
             ** Generate networking extension that will
             ** provide typed queries and responses.
             */
//            networkFile.container += self.generate(networkExtensionsWith: queryType, mutationType: mutationType)
            
            return [
                aliasesFile,
                enumsFile,
                rootQueriesFile,
                queriesFile,
//                modelsFile,
                inputsFile,
//                networkFile,
                fragmentsFile,
            ]
        }
        
        // ----------------------------------
        //  MARK: - (Query) Type Generation -
        //
        private func generate(enum object: __Schema.__Object) -> Class {
            precondition(object.kind == .enum)
            
            let enumClass = Class(
                visibility:   .public,
                kind:         .enum,
                name:         object.name,
                inheritances: ["String"],
                comments:     object.descriptionComments()
            )
            
            for value in object.enumValues! {
                enumClass.add(child: EnumCase(
                    name:     "`\(value.name.snakeToCamel ?? value.name)`",
                    value:    .quoted(value.name),
                    comments: value.descriptionComments()
                ))
            }
            
            return enumClass
        }
        
        private func generate(scalar: String) -> Alias? {
            
            /* ----------------------------------------
             ** Ensure that we're not creating a type
             ** alias for a standard type (redundant).
             */
            guard !self.standardScalars.contains(scalar) else {
                return nil
            }
            
            return Alias(
                visibility: .public,
                name:       scalar,
                forType:    self.customScalarTypes[scalar] ?? "String"
            )
        }
        
        private func generate(interface: __Schema.__Object, parsedTypes: [String : __Schema.__Object]) -> [Class] {
            
            precondition(interface.kind == .interface)
            
            var container: [Class] = []
            
            /* -------------------------------------------
             ** Initialize the abstract protocol. It will
             ** also have a concrete class of similar name
             */
            let swiftInterface = Class(
                visibility:   .public,
                kind:         .protocol,
                name:         interface.queryTypeName,
                inheritances: interface.inheritances(),
                comments:     interface.descriptionComments()
            )
            
            if let fields = interface.fields {
                swiftInterface += self.generate(fields: fields, ofType: "Self", isInterface: true, rootType: nil)
            }
            
            container += swiftInterface
            
            /* ----------------------------------------
             ** Iterate over all possibleTypes and check 
             ** if any implemented interface properties 
             ** have arguments in the object implementation. 
             ** If so, we'll add a default implementation 
             ** with no arguments.
             */
            if let possibleTypes = interface.possibleTypes,
                let fields = interface.fields {
                
                /* -----------------------------------------
                 ** Create a set of field names contained in
                 ** this interface so we can query against it.
                 */
                let fieldNameDictionary = fields.keyedUsing { $0.name }
                
                for possibleType in possibleTypes {
                    
                    /* ----------------------------------------
                     ** We assume that all possible types have
                     ** a non-null name property that is it's type.
                     */
                    if let object = parsedTypes[possibleType.possibleName!] {
                        
                        /* ---------------------------------------
                         ** Filter out only the fields that have
                         ** arguments and correspond to the fields
                         ** declared in the interface.
                         */
                        let objectFields = object.fields!.filter {
                            if let interfaceField = fieldNameDictionary[$0.name] {
                                return interfaceField.arguments.count != $0.arguments.count
                            }
                            return false
                        }
                        
                        if !objectFields.isEmpty {
                            let swiftExtension = Class(
                                visibility: .public,
                                kind:       .extension,
                                name:       possibleType.queryTypeName,
                                comments:   [
                                    Swift.Line(content: "Auto-generated property for compatibility with `\(interface.queryTypeName)`")
                                ]
                            )
                            
                            for objectField in objectFields {
                                swiftExtension += self.generate(propertyFor: objectField, ofType: swiftExtension.name, isInterface: false)
                            }
                            
                            container += swiftExtension
                        }
                    }
                }
            }
            
            return container
        }
        
        private func generate(concreteInterface: __Schema.__Object) -> Class {
            
            precondition(concreteInterface.kind == .interface || concreteInterface.kind == .union)
            
            /* ---------------------------------------------
             ** Initialize a concrete class for the protocol
             ** since we cannot execute builder methods on
             ** an abstract protocol type.
             */
            let swiftClass = Class(
                visibility:   .public,
                kind:         .class(.final),
                name:         concreteInterface.queryConcreteTypeName,
                inheritances: ["GraphQLTypedField", concreteInterface.queryTypeName],
                comments:     [
                    Swift.Line(content: "Concrete type auto-generated for `\(concreteInterface.queryTypeName)`")
                ]
            )
            
            if let fields = concreteInterface.fields {
                swiftClass += self.generate(fields: fields, ofType: swiftClass.name, isInterface: false, rootType: nil)
            }
            
            if let possibleTypes = concreteInterface.possibleTypes {
                for possibleType in possibleTypes {
                    
                    let fieldName = possibleType.name
                    let typeName  = possibleType.queryTypeName
                    
                    let closure   = self.closureNameWith(type: typeName)
                    let parameter = Method.Parameter(
                        alias: "_",
                        name:  closure.name,
                        type:  closure.type
                    )
                    
                    let method = Method(
                        visibility: .public,
                        name:        .function(.none, "on\(fieldName)"),
                        returnType:  swiftClass.name,
                        parameters:  [parameter],
                        annotations: [.discardableResult],
                        body:        self.inlineFragmentContentWith(type: typeName, field: fieldName),
                        comments:    [
                            Line(content: "Use an inline fragment to query specific fields of `\(typeName)`")
                        ]
                    )
                    
                    swiftClass.add(child: method)
                }
            }
            
            return swiftClass
        }
        
        private func generate(union: __Schema.__Object) -> [Class] {
            
            precondition(union.kind == .union)
            
            var container: [Class] = []
            
            /* -----------------------------------------
             ** Initialize the class that will represent
             ** this object.
             */
            let swiftClass = Class(
                visibility:   .public,
                kind:         .protocol,
                name:         union.queryTypeName,
                inheritances: union.inheritances(),
                comments:     union.descriptionComments()
            )
            
            container += swiftClass
            
            if let possibleTypes = union.possibleTypes {
                possibleTypes.forEach {
                    
                    container += Class(
                        visibility:   .none,
                        kind:         .extension,
                        name:         $0.queryTypeName,
                        inheritances: [union.queryTypeName]
                    )
                }
            }
            
            return container
        }
        
        private func generate(object: __Schema.__Object, rootType: String?) -> Class {
            
            precondition(object.kind == .object)

            /* -----------------------------------------
             ** Initialize the class that will represent
             ** this object.
             */
            let swiftClass = Class(
                visibility:   .public,
                kind:         .class(.final),
                name:         object.queryTypeName,
                inheritances: object.inheritances(from: rootType != nil ? [] : [self.fieldClassName()]),
                comments:     object.descriptionComments()
            )
            
            if let fields = object.fields {
                swiftClass += self.generate(fields: fields, ofType: object.queryTypeName, isInterface: false, rootType: rootType)
            }
            
            return swiftClass
        }
        
        private func generate(inputObject: __Schema.__Object) -> Class {
            
            precondition(inputObject.kind == .inputObject)
            
            /* -----------------------------------------
             ** Initialize the class that will represent
             ** this object.
             */
            let swiftClass = Class(
                visibility:   .public,
                kind:         .struct,
                name:         inputObject.queryTypeName,
                inheritances: inputObject.inheritances(from: [self.inputClassName()]),
                comments:     inputObject.descriptionComments()
            )
            
            if let fields = inputObject.inputFields {
                
                /* -----------------------------------
                 ** First we create stored  properties
                 ** that will be set by the caller.
                 */
                for field in fields {
                    swiftClass += self.generate(inputPropertyFor: field)
                }
                
                var initParams: [Method.Parameter] = []
                for field in fields {
                    initParams += Method.Parameter(
                        name:    field.name,
                        type:    field.type.recursiveQueryInputType(unmodified: field.type.hasScalar),
                        default: field.type.isTopLevelNullable ? .nil : nil
                    )
                }
                
                var initBody: [Line] = []
                for field in fields {
                    initBody += Line(content: "self.\(field.name) = \(field.name)")
                }
                
                swiftClass += Method(
                    visibility: .public,
                    name:       .initialization(.none, false),
                    parameters: initParams,
                    body:       initBody,
                    comments:   [
                        "Auto-generate initialier that provides default values for nullable parameters"
                    ]
                )
                
                /* ------------------------------------------
                 ** We then create a conformance to InputType
                 ** by declaring and implementing the following
                 ** method, appending only parameters that
                 ** have been set (ignoring nil params).
                 */
                var body: [Line] = []
                
                body += "var parameters: [GraphQLParameter] = []"
                body += ""
                
                /* -----------------------------
                 ** Append non-null values first
                 */
                let nonNullFields = fields.filter { !$0.type.isTopLevelNullable }
                if !nonNullFields.isEmpty {
                    
                    for field in nonNullFields {
                        body += Line(content: "parameters += GraphQLParameter(name: \"\(field.name)\", value: self.\(field.name))")
                    }
                    body += ""
                }
                
                /* -----------------------------
                 ** Append nullable values after
                 */
                let nullableFields = fields.filter { $0.type.isTopLevelNullable }
                if !nullableFields.isEmpty {
                    
                    for field in nullableFields {
                        body += Line(content: "if let v = self.\(field.name) { parameters += GraphQLParameter(name: \"\(field.name)\", value: v) }")
                    }
                    body += ""
                }
                
                body += "return parameters"
                
                swiftClass += Method(
                    visibility:  .public,
                    name:        .function(.none, "_representationParameters"),
                    returnType:  "[GraphQLParameter]",
                    body:        body,
                    comments:    ["Auto-generated method for conformance to InputType"]
                )
            }
            
            return swiftClass
        }
        
        private func generate(networkExtensionsWith queryType: TypeName?, mutationType: TypeName?) -> Class {
            let swiftExtension = Class(
                visibility:   .public,
                kind:         .extension,
                name:         "URLSession",
                comments:     [
                    "Auto-generated extension for typed networking models."
                ]
            )
            
            if let queryType = queryType {
                swiftExtension += Method(
                    visibility: .public,
                    name:       .function(.none, "graphQueryTask"),
                    returnType: "URLSessionDataTask",
                    parameters: [
                        Method.Parameter(
                            alias: "with",
                            name:  "query",
                            type:  queryType.queryTypeName
                        ),
                        Method.Parameter(
                            alias: "to",
                            name:  "url",
                            type:  "URL"
                        ),
                        Method.Parameter(
                            name:  "completionHandler",
                            type:  "@escaping (\(queryType.name)?, HTTPURLResponse?, GraphError?) -> Void"
                        )
                    ],
                    body: [
                        "return self.graphTask(with: query, to: url, completionHandler: completionHandler)"
                    ]
                )
            }
            
            if let mutationType = mutationType {
                swiftExtension += Method(
                    visibility: .public,
                    name:       .function(.none, "graphMutationTask"),
                    returnType: "URLSessionDataTask",
                    parameters: [
                        Method.Parameter(
                            alias: "with",
                            name:  "mutation",
                            type:  mutationType.queryTypeName
                        ),
                        Method.Parameter(
                            alias: "to",
                            name:  "url",
                            type:  "URL"
                        ),
                        Method.Parameter(
                            name:  "completionHandler",
                            type:  "@escaping (\(mutationType.name)?, HTTPURLResponse?, GraphError?) -> Void"
                        )
                    ],
                    body: [
                        "return self.graphTask(with: mutation, to: url, completionHandler: completionHandler)"
                    ]
                )
            }
            
            return swiftExtension
        }
        
        // ----------------------------------
        //  MARK: - (Model) Type Generation -
        //
        private func generate(concreteInterfaceModel concreteInterface: __Schema.__Object) -> Class {
            
            precondition(concreteInterface.kind == .interface || concreteInterface.kind == .union)
            
            let swiftClass = Class(
                visibility:   .public,
                kind:         .class(.final),
                name:         concreteInterface.modelConcreteTypeName,
                inheritances: [self.modelConcreteClassName()],
                comments:     [
                    Line(content: "Auto-generated concrete model for interface `\(concreteInterface.modelTypeName)`"),
                ]
            )
            
            swiftClass += self.generate(typeNamePropertyWith: concreteInterface.name)
            
            /* ----------------------------------------
             ** A concrete interface has some fields.
             ** These fields are shared among all types
             ** that implement this interface. We want
             ** to provide access to these as well.
             */
            if let fields = concreteInterface.fields {
                
                for field in fields {
                    swiftClass += self.generate(modelPropertyFor: field)
                }
            }
            
            /* ------------------------------------------
             ** A concrete interface model is really just
             ** a proxy that provides typed access to it's
             ** children. These are the possible types.
             */
            if let possibleTypes = concreteInterface.possibleTypes {
                for possibleType in possibleTypes {
                    
                    let typeName = possibleType.modelTypeName.implicitNullable
                    swiftClass += Property(
                        visibility: .public,
                        name:       possibleType.name.lowercasedFirst,
                        returnType: typeName,
                        accessors:  [
                            Property.Accessor(kind: .get, body: [
                                Line(content: "return try! self.valueFor(nullable: \"\(possibleType.name.lowercasedFirst)\")")
                            ]),
                            Property.Accessor(kind: .set, body: [
                                Line(content: "self.set(newValue, for: \"\(possibleType.name.lowercasedFirst)\")")
                            ]),
                        ],
                        comments: [
                            Line(content: "Auto-generated property for fragment on `\(possibleType.modelTypeName)`"),
                        ]
                    )
                }
            }
            
            swiftClass += self.generate(initializerWith: concreteInterface.fields, types: concreteInterface.possibleTypes)
            
            return swiftClass
        }
        
        private func genereteFragment(objectModel object: __Schema.__Object) -> Class {
            precondition(object.kind == .object)
            
            let swiftClass = Class(
                visibility:   .public,
                kind:         .class(.final),
                name:         object.queryTypeName + "Fragment",
                inheritances: ["GraphQLFragment"],
                comments:     object.descriptionComments()
            )
            
            swiftClass += Property(kind: .static,
                                    visibility: .public,
                                    name: "typeName",
                                    returnType: "String",
                                    body: [
                                        Line(content: "return \"\(object.modelTypeName)\"")
                                    ])
            
            swiftClass += Line(content: "private(set) public var name: String")
            swiftClass += Line(content: "private(set) public var field: \(object.queryTypeName)")

            swiftClass += Method(visibility: .public, name: .initialization(.required, false), parameters: [
                Method.Parameter(name: "name", type: "String"),
                Method.Parameter(name: "field", type: object.queryTypeName)
            ], body: [
                Swift.Line(content: "self.name = name"),
                Swift.Line(content: "self.field = field")
            ])
            
            return swiftClass
        }
        
        private func generate(objectModel object: __Schema.__Object, parsedTypes: [String: __Schema.__Object]) -> Class {
            
            precondition(object.kind == .object)
            
            /* -----------------------------------------
             ** Initialize the class that will represent
             ** this object.
             */
            let swiftClass = Class(
                visibility:   .public,
                kind:         .class(.final),
                name:         object.modelTypeName,
                inheritances: [self.modelClassName()],
                comments:     object.descriptionComments()
            )
            
            swiftClass += self.generate(typeNamePropertyWith: object.name.mapped)
            
            if let fields = object.fields {
                
                /* ---------------------------------
                 ** Generate the properties of this
                 ** model object.
                 */
                for field in fields {
                    
                    var fieldAlias: String?
                    
                    /* ------------------------------------
                     ** If the field is a connection, we'll
                     ** create a convenience accessor for
                     ** all the nodes it's edges contain.
                     */
                    if let fieldObject = parsedTypes[field.type.leaf.possibleName!], let _ = fieldObject.edgesField {
                        fieldAlias = field.nameForConnection
                        swiftClass += self.generate(modelConnectionPropertyFor: field, parsedTypes: parsedTypes)
                    }
                    
                    swiftClass += self.generate(modelPropertyFor: field, nameAlias: fieldAlias)
                }
                
                swiftClass += self.generate(initializerWith: fields, types: nil)
                
                /* ----------------------------------
                 ** Generate the alias accessors that
                 ** can convert JSON response object
                 ** into valid models on demand. This
                 ** only applies to non-scalars, tho.
                 */
                for field in fields where !field.type.hasScalar && !field.type.isCollection {
                    swiftClass += self.generate(modelMethodFor: field)
                }
            }
            
            return swiftClass
        }
        
        // ----------------------------------
        //  MARK: - (Model) Member Generation -
        //
        private func generate(typeNamePropertyWith name: String) -> Property {
            return Property(
                kind:       .static,
                visibility: .public,
                override:   true,
                name:       "typeName",
                returnType: "String",
                body:       [
                    Line(content: "return \"\(name)\""),
                ]
            )
        }
        
        private func generate(initializerWith fields: [__Schema.__Field]?, types: [__Schema.__ObjectType]?) -> Method {
            var initBody: [Line] = []
            
            initBody += "super.init(json: json)"
            
            /* ----------------------------------------
             ** Iterate overall all the provided fields
             ** and generate scalar / object assignments.
             */
            if let fields = fields, !fields.isEmpty {
                
                func typeNameFor(_ field: __Schema.__Field) -> String {
                    return field.type.recursiveType(queryKind: .model, unmodified: field.type.hasScalar, ignoreNull: true)
                }
                
                /* ---------------------------------
                 ** Generate all the scalar fields
                 */
                let scalarFields = fields.filter { $0.type.hasScalar }
                if !scalarFields.isEmpty {
                    initBody += ""
                    
                    for field in scalarFields {
                        // TODO: What if it's a scalar collection?
                        initBody += self.generate(propertyAssignmentNamed: field.name, type: typeNameFor(field), isScalar: true, isFragment: false, isCollection: false)
                    }
                }
                
                /* ---------------------------------
                 ** Generate all the object fields
                 */
                let objectFields = fields.filter { !$0.type.hasScalar }
                if !objectFields.isEmpty {
                    initBody += ""
                    
                    for field in objectFields {
                        initBody += self.generate(propertyAssignmentNamed: field.name, type: typeNameFor(field), isScalar: false, isFragment: false, isCollection: field.type.isCollection)
                    }
                }
            }
            
            /* ----------------------------------------
             ** Iterarate over all possible types and
             ** generate a passthrough assignment. A
             ** passthrough is when we pass the `json`
             ** straight into the object initializer
             ** without accessing any of the children.
             */
            if let types = types, !types.isEmpty {
                initBody += ""
                
                for type in types {
                    precondition(!type.hasScalar) // These should always be possible object types
                    
                    let name  = type.recursiveType(queryKind: .model, unmodified: false, ignoreNull: true)
                    initBody += self.generate(propertyAssignmentNamed: type.name.lowercasedFirst, type: name, isScalar: false, isFragment: true, isCollection: type.isCollection)
                }
            }
            
            return Method(
                visibility: .public,
                name:       .initialization(.required, true),
                parameters: [
                    Method.Parameter(name: "json", type: "JSON"),
                ],
                body: initBody
            )
        }
        
        private func generate(propertyAssignmentNamed name: String, type: String, isScalar: Bool, isFragment: Bool, isCollection: Bool = false) -> Line {
            if isScalar {
                return Line(content: "try! self.set(valueFrom: json, for: \"\(name)\", type: \(type).self)")
                
            } else {
                
                if isFragment {
                    return Line(content: "try! self.set(json: json, for: \"\(name)\", type: \(type).self)")
                } else {
                    if isCollection {
                        return Line(content: "try! self.set(modelCollectionFrom: json, for: \"\(name)\", type: \(type).self)")
                    } else {
                        return Line(content: "try! self.set(modelFrom: json, for: \"\(name)\", type: \(type).self)")
                    }
                }
                
                
            }
        }
        
        private func generate(modelConnectionPropertyFor field: __Schema.__Field, parsedTypes: [String: __Schema.__Object]) -> Property {
            
            let result   = self.unwrapConnectionStartingAt(connectionField: field, parsedTypes: parsedTypes)!
            let typeName = result.nodeType.recursiveType(queryKind: .model, concrete: true, unmodified: field.type.hasScalar, ignoreNull: true)
            
            return Property(
                visibility:  .public,
                name:        field.name,
                returnType:  "[\(typeName)]",
                annotations: field.isDeprecated ? [self.deprecationAnnotationWith(field.deprecationReason)] : nil,
                body: [
                    Line(content: result.content),
                ],
                comments: field.descriptionComments()
            )
        }
        
        private func generate(modelPropertyFor field: __Schema.__Field, nameAlias: String? = nil) -> Property {
            let nullability = field.type.isTopLevelNullable ? "nullable" : "nonnull"
            let typeName    = field.type.recursiveType(queryKind: .model, concrete: true, unmodified: field.type.hasScalar)
            
            return Property(
                visibility:  .public,
                name:        nameAlias ?? field.name,
                returnType:  typeName,
                annotations: field.isDeprecated ? [self.deprecationAnnotationWith(field.deprecationReason)] : nil,
                accessors:   [
                    Property.Accessor(kind: .get, body: [
                        Line(content: "return try! self.valueFor(\(nullability): \"\(field.name)\")")
                        ]),
                    Property.Accessor(kind: .set, body: [
                        Line(content: "self.set(newValue, for: \"\(field.name)\")")
                        ]),
                    ],
                comments: field.descriptionComments()
            )
        }
        
        private func generate(modelMethodFor field: __Schema.__Field) -> Method {
            let fieldType = field.type.recursiveType(queryKind: .model, concrete: true, unmodified: field.type.hasScalar)
            
            return Method(
                visibility: .public,
                name:       .function(.none, field.name),
                returnType: fieldType,
                parameters: [
                    Method.Parameter(
                        alias: "_",
                        name:  "alias",
                        type:  "String"
                    )
                ],
                annotations: field.isDeprecated ? [self.deprecationAnnotationWith(field.deprecationReason)] : nil,
                body:  [
                    Line(content: "return try! self.aliasedWith(alias)"),
                    ],
                comments: field.descriptionComments()
            )
        }
        
        // ----------------------------------
        //  MARK: - (Query) GraphQLField Generation -
        //
        private func generate(initNamed name: String, type: String) -> Method {
            let closure = self.closureNameWith(type: type)
            
            return Method(
                visibility:  .public,
                name:        .initialization(.convenience, false),
                parameters:  [
                    Method.Parameter(
                        alias: "_",
                        name:  closure.name,
                        type:  closure.type
                    )
                ],
                body:        [
                    Line(content: "self.init(name: \"\(name)\", parameters: [])"),
                    Line(content: "\(closure.name)(self)"),
                ],
                comments:    [
                    "Auto-generated convenience initializer"
                ]
            )
        }
        
        private func generate(inputPropertyFor field: __Schema.__InputField) -> Property {
            return Property(
                visibility: .public,
                name:       field.name,
                returnType: field.type.recursiveQueryInputType(unmodified: field.type.hasScalar),
                comments:   field.descriptionComments()
            )
        }
        
        private func generate(fields: [__Schema.__Field], ofType name: String, isInterface: Bool, rootType: String?) -> [Container] {
            
            var containers: [Container] = []
            
            for field in fields {
                
                /* -------------------------------------------
                 ** If the field is a scalar value and takes
                 ** no arguments (no need for a method), there's 
                 ** a gurantee that it cannot accept subfields
                 ** and will represented by a property rather
                 ** than a method with a `buildOn` parameter.
                 */
                if field.type.hasScalar && field.arguments.isEmpty {
                    containers += self.generate(propertyFor: field, ofType: name, isInterface: isInterface, isDeprecated: field.isDeprecated, deprecationReason: field.deprecationReason)
                } else {
                    containers += self.generate(methodFor: field, ofType: name, isInterface: isInterface, buildable: !field.type.hasScalar, rootType: rootType, valueType: false)
                    if !field.arguments.isEmpty {
                        containers += self.generate(methodFor: field, ofType: name, isInterface: isInterface, buildable: !field.type.hasScalar, rootType: rootType, valueType: true)
                    }
                    if rootType != nil {
                        containers += self.generate(methodFor: field, ofType: name, isInterface: isInterface, buildable: false, rootType: rootType, fragment: true, valueType: false)
                        if !field.arguments.isEmpty {
                            containers += self.generate(methodFor: field, ofType: name, isInterface: isInterface, buildable: false, rootType: rootType, fragment: true, valueType: true)
                        }
                    }
                }
            }
            
            return containers
        }
        
        private func generate<T>(propertyFor field: T, ofType type: String, isInterface: Bool, isDeprecated: Bool = false, deprecationReason: String? = nil) -> Property where T: Typeable, T: Describeable {
            
            let isScalar = field.type.hasScalar
            
            let body: [Line]
            if isInterface {
                body = ["get"]
            } else {
                let type = field.type.recursiveType(queryKind: .query, unmodified: field.type.hasScalar)
                body     = self.subfieldBodyWith(name: field.name, type: type, buildable: false, isObject: !isScalar, rootType: nil)
            }
            
            var comments = field.descriptionComments()
            
            if isScalar {
                comments += Line(content: " - Value Type: `\(field.type.recursiveQueryType(unmodified: field.type.hasScalar))`")
            }
            
            /* ---------------------------------
             ** Mark deprecated fields that will
             ** be removed in future schemas.
             */
            var annotations: [Annotation] = []
            if isDeprecated {
                annotations += self.deprecationAnnotationWith(deprecationReason)
            }
            
            return Property(
                visibility:  isInterface ? .none : .public,
                name:        field.name,
                returnType:  isInterface ? "Self" : type,
                annotations: annotations,
                body:        body,
                comments:    comments
            )
        }
        
        private func generate(methodFor field: __Schema.__Field, ofType type: String, isInterface: Bool, buildable: Bool, rootType: String?, fragment: Bool = false, valueType: Bool) -> Method {
            
            precondition(!field.arguments.isEmpty || !field.type.hasScalar)
            
            /* ----------------------------------------
             ** Build the parameters based on arguments
             ** accepted by this field.
             */
            var parameters = [Method.Parameter(alias: "alias", name: "_alias", type: "String?", default: .nil)]
            
            parameters += field.parameters(isInterface: isInterface, valueType: valueType)
            
            /* ----------------------------------------
             ** We append the `buildOn` closure only if
             ** the field type isn't a scalar type. We
             ** can't nest fields in scalar types.
             */
            let fieldType = field.type.leaf.recursiveType(queryKind: .query, unmodified: field.type.hasScalar, ignoreNull: true)
            
            if buildable && fragment == false {
                let closure = self.closureNameWith(type: fieldType)
                
                parameters += Method.Parameter(
                    alias: "_",
                    name:  closure.name,
                    type:  closure.type
                )
            } else if fragment && buildable == false {
                parameters += Method.Parameter(name: "fragment", type: field.type.leaf.queryTypeName + "Fragment")
            }
            
            var body: [Line] = []
            if !isInterface {
                body = self.subfieldBodyWith(name: field.name, type: fieldType, buildable: buildable, isObject: !field.type.hasScalar, arguments: field.arguments, rootType: rootType, fragment: fragment)
            }
            
            /* ---------------------------------
             ** Mark deprecated fields that will
             ** be removed in future schemas.
             */
            var annotations: [Annotation] = []
            if rootType == nil {
                annotations.append(.discardableResult)
            }
            
            if field.isDeprecated {
                annotations += .available([
                    .init(platform: .any),
                    .init(name: .deprecated)
                ])
            }
            
            return Method(
                visibility:  isInterface ? .none : .public,
                name:        .function(rootType != nil ? .static : .none, field.name),
                returnType:  isInterface ? "Self" : rootType ?? type,
                parameters:  parameters,
                annotations: annotations,
                body:        body,
                comments:    field.parameterDocComments()
            )
        }
        
        // ----------------------------------
        //  MARK: - Content -
        //
        private func modelNamespace() -> String {
            return "Model"
        }
        
        private func modelClassName() -> String {
            return "GraphModel"
        }
        
        private func modelConcreteClassName() -> String {
            return "ConcreteGraphModel"
        }
        
        private func fieldClassName() -> String {
            return "GraphQLField"
        }
        
        private func inputClassName() -> String {
            return "GraphQLInputType"
        }
        
        private func closureNameWith(type: String) -> (name: String, type: String) {
            return (
                name: "buildOn",
                type: "(\(type)) -> Void"
            )
        }
        
        private func subfieldBodyWith(name: String, type: String, buildable: Bool, isObject: Bool, arguments: [__Schema.__Argument]? = nil, rootType: String?, fragment: Bool = false) -> [Line] {
            var lines: [Line] = []
            
            /* ----------------------------------------
             ** If this field accepts arguments, we'll
             ** need to add logic for appending only
             ** non-nil parameters (those that are set).
             */
            var paramVariable = "[]"
            if let arguments = arguments, !arguments.isEmpty {
                
                let closure = self.closureNameWith(type: "")
                
                lines += "var parameters: [GraphQLParameter] = []"
                lines += ""
                
                paramVariable = "parameters"
                
                /* -----------------------------
                 ** Append non-null values first
                 */
                let nonNullArguments = arguments.filter { !$0.type.isTopLevelNullable }
                if !nonNullArguments.isEmpty {
                    
                    for argument in nonNullArguments where argument.name != closure.name {
                        lines += Line(content: "parameters.append(GraphQLParameter(name: \"\(argument.name)\", value: \(argument.name)))")
                    }
                    lines += ""
                }
                
                /* -----------------------------
                 ** Append nullable values after
                 */
                let nullableArguments = arguments.filter { $0.type.isTopLevelNullable }
                if !nullableArguments.isEmpty {
                    
                    for argument in nullableArguments where argument.name != closure.name {
                        lines += Line(content: "if let arg = \(argument.name) { parameters.append(GraphQLParameter(name: \"\(argument.name)\", value: arg)) }")
                    }
                    lines += ""
                }
            }
            
            /* ----------------------------------------
             ** Ensure that we aren't creating field
             ** subclass instances of scalar types but
             ** only object types.
             */
            let objectType: String
            if isObject {
                objectType = type
            } else {
                objectType = self.fieldClassName()
            }
            
            if buildable {
                lines += Line(content: "let field = \(objectType)(name: \"\(name)\", alias: _alias, parameters: \(paramVariable))")
            } else {
                lines += Line(content: "let field = \(objectType)(name: \"\(name)\", parameters: \(paramVariable))")
            }
            if rootType == nil {
                lines += Line(content: "try! self._add(child: field)")
                lines += Line(content: "")
            }
            
            if buildable {
                lines += Line(content: "buildOn(field)")
                lines += Line(content: "")
            }
            if fragment {
                lines += Line(content: "field.fragment(fragment)")
                lines += Line(content: "")
            }
            if let rootType = rootType {
                if fragment {
                    lines += Line(content: "return \(rootType)(field: field, fragment: fragment)")
                } else {
                    lines += Line(content: "return \(rootType)(field: field)")
                }
            } else {
                lines += Line(content: "return self")
            }
            
            return lines
        }
        
        private func inlineFragmentContentWith(type: String, field: String) -> [Line] {
            var lines: [Line] = []
            
            lines += Line(content: "let field    = \(type)(name: \"\", parameters: [])")
            lines += Line(content: "let fragment = GraphQLInlineFragment(type: \"\(field)\")")
            lines += Line(content: "")
            lines += Line(content: "try! self._add(child: fragment)")
            lines += Line(content: "")
            lines += Line(content: "buildOn(field)")
            lines += Line(content: "try! fragment._add(children: field._children)")
            lines += Line(content: "")
            lines += Line(content: "return self")
            
            
            return lines
        }
        
        private func unwrapConnectionStartingAt(connectionField: __Schema.__Field, parsedTypes: [String: __Schema.__Object]) -> (content: String, nodeType: __Schema.__ObjectType)? {
            
            if let connection  = parsedTypes[connectionField.type.leaf.name],
                let edgesField = connection.edgesField,
                let edges      = parsedTypes[edgesField.type.leaf.name],
                let nodeField  = edges.nodeField {
                
                let edgeNullability = edgesField.type.isTopLevelNullable ? "?" : ""
                let expNullability  = edgesField.type.isTopLevelNullable ? " ?? []" : ""
                let nodeNullability = edgesField.type.isLeafNullable ? "?" : ""
                
                let content = "return " +
                    "self." +
                    "\(connectionField.nameForConnection)." +
                    "\(edgesField.name)\(edgeNullability)." +
                    "flatMap { " +
                    "$0\(nodeNullability)." +
                    "\(nodeField.name)" +
                    " }\(expNullability)"
                
                return (content, nodeField.type.leaf)
            }
            return nil
        }
        
        // ----------------------------------
        //  MARK: - Deprecations -
        //
        private func deprecationAnnotationWith(_ message: String?) -> Annotation {
            var parameters: [Annotation.Parameter] = [
                .init(platform: .any),
                .init(name: .deprecated)
            ]
            
            if let message = message, !message.isEmpty {
                parameters += .init(name: .message, value: .quoted(message))
            }
            
            return .available(parameters)
        }
    }
}

// ----------------------------------
//  MARK: - Extensions -
//
fileprivate extension Array {
    
    func keyedUsing(block: (Element) -> String) -> [String : Element] {
        var dictionary: [String : Element] = [:]
        self.forEach {
            dictionary[block($0)] = $0
        }
        return dictionary
    }
    
    func forEachFilteredUsing(_ filter: (Element) -> Bool, _ body: (Element) throws -> Void) rethrows {
        for element in self where filter(element) {
            try body(element)
        }
    }
}

// ----------------------------------
//  MARK: - Schema Type Extensions -
//

extension __Schema.__Object {
    
    func descriptionComments() -> [Swift.Line] {
        var commentLines = Swift.Line.linesWith(requiredContent: self.description ?? "")
        
        /* ----------------------------------------
         ** If this is an interface, we'll append
         ** additional comments about what possible 
         ** types implement this interface.
         */
        if let possibleTypes = self.possibleTypes, !possibleTypes.isEmpty {
            
            commentLines += ""
            commentLines += "## Implementing types:"
            
            for possibleType in possibleTypes {
                commentLines += Swift.Line(content: " - `\(possibleType.queryTypeName)`")
            }
        }
        
        return commentLines
    }
    
    func inheritances(from: [String]? = nil) -> [String] {
        
        /* ----------------------------------------
         ** Build all interfaces and superclasses
         ** that this object will inherit from.
         */
        var inheritances: [String] = from ?? []
        
        if let interfaces = self.interfaces, !interfaces.isEmpty {
            inheritances += interfaces.map {
                $0.queryTypeName
            }
        }
        
        return inheritances
    }
}

// ----------------------------------
//  MARK: - String Extension -
//
fileprivate extension String {
    
    private static var __TypeMap: [String : String] = [
        "String"  : "String",
        "Boolean" : "Bool",
        "Int"     : "Int",
        "Float"   : "Float",
    ]
    
    var mapped: String {
        if let type = String.__TypeMap[self] {
            return type
        }
        return self
    }
    
    var nullable: String {
        return "\(self)?"
    }
    
    var implicitNullable: String {
        return "\(self)!"
    }
}

// ----------------------------------
//  MARK: - Nameable Extension -
//
fileprivate extension Nameable {
    
    var queryConcreteTypeName: String {
        return "GQLConcrete\(self.name.mapped)"
    }
    
    var queryTypeName: String {
        return "GQL\(self.name.mapped)"
    }
    
    var modelConcreteTypeName: String {
        return "Concrete\(self.name.mapped)"
    }
    
    var modelTypeName: String {
        return "\(self.name.mapped)"
    }
}

fileprivate struct TypeName: Nameable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    init?(name: String?) {
        guard let name = name  else {
            return nil
        }
        self.init(name: name)
    }
}

// ----------------------------------
//  MARK: - ObjectType Extension -
//
fileprivate extension __Schema.__ObjectType {
    
    enum RecursiveKind {
        case query
        case model
    }
    
    func recursiveQueryInputType(unmodified: Bool) -> String {
        let type = self.recursiveType(queryKind: .query, unmodified: unmodified, ignoreNull: true)
        return self.isTopLevelNullable ? type.nullable : type
    }
    
    func recursiveModelInputType(unmodified: Bool) -> String {
        let type = self.recursiveType(queryKind: .model, unmodified: unmodified, ignoreNull: true)
        return self.isTopLevelNullable ? type.nullable : type
    }
    
    func recursiveQueryType(unmodified: Bool, ignoreNull: Bool = false) -> String {
        return self.recursiveType(queryKind: .query, unmodified: unmodified, ignoreNull: ignoreNull)
    }
    
    func recursiveModelType(unmodified: Bool, ignoreNull: Bool = false) -> String {
        return self.recursiveType(queryKind: .model, unmodified: unmodified, ignoreNull: ignoreNull)
    }
    
    func recursiveQueryConcreteType() -> String {
        return self.recursiveType(queryKind: .query)
    }
    
    func recursiveModelConcreteType() -> String {
        return self.recursiveType(queryKind: .model)
    }
    
    func recursiveType(queryKind: RecursiveKind, concrete: Bool? = nil, unmodified: Bool = false, ignoreNull: Bool = false) -> String {
        return self.recursiveType(queryKind: queryKind, nonNull: false, withinList: false, concrete: concrete ?? self.isAbstract, unmodified: unmodified, ignoreNull: ignoreNull)
    }
    
    private func recursiveType(queryKind: RecursiveKind, nonNull: Bool, withinList: Bool, concrete: Bool, unmodified: Bool, ignoreNull: Bool, level: Int = 0) -> String {
        
        let isNonNull    = self.kind == .nonNull
        let isWithinList = withinList || self.kind == .list // Persist flag through recursion
        let childType    = self.ofType?.recursiveType(queryKind: queryKind, nonNull: isNonNull, withinList: isWithinList, concrete: concrete, unmodified: unmodified, ignoreNull: ignoreNull, level: level + 1) ?? ""
        
        switch self.kind {
        case .enum:       fallthrough
        case .union:      fallthrough
        case .scalar:     fallthrough
        case .object:     fallthrough
        case .interface:  fallthrough
        case .inputObject:
            
            let modifiedType: () -> String = {
                switch queryKind {
                case .query: return self.isAbstract ? self.queryConcreteTypeName : self.queryTypeName
                case .model: return self.isAbstract ? self.modelConcreteTypeName : self.modelTypeName
                }
            }
            
            if nonNull || ignoreNull {
                return unmodified ? self.name.mapped : modifiedType()
            } else {
                let type = unmodified ? self.name.mapped : modifiedType()
                return isWithinList ? type.nullable : type.implicitNullable
            }
            
        case .list:
            
            if nonNull || ignoreNull {
                return "[\(childType)]"
            } else {
                return "[\(childType)]".implicitNullable
            }
            
        case .nonNull:
            return childType
        }
    }
}

// ----------------------------------
//  MARK: - Describeable Extension -
//
fileprivate extension Describeable {
    
    func descriptionComments() -> [Swift.Line] {
        return Swift.Line.linesWith(requiredContent: self.description ?? "No documentation available for `\(self.name)`")
    }
}

// ----------------------------------
//  MARK: - Argument Extension -
//
fileprivate extension __Schema.__Argument {
    
    func methodParameter(useDefaultValues: Bool, valueType: Bool) -> Swift.Method.Parameter {
        
        let nullable = self.type.isTopLevelNullable
        
        var defaultValue: Swift.Method.Parameter.Default?
        if nullable && useDefaultValues {
            defaultValue = .nil
        }
        
        let type = self.type.recursiveQueryType(unmodified: self.type.hasScalar, ignoreNull: true)
        let typeString = valueType ? "GraphQLValue<\(type)>" : type

        return Swift.Method.Parameter(
            name:    self.name,
            type:    nullable ? typeString.nullable : typeString,
            default: defaultValue
        )
    }
}


// ----------------------------------
//  MARK: - GraphQLField Extension -
//
fileprivate extension __Schema.__Field {
    
    var nameForConnection: String {
        return "\(self.name)Connection"
    }
    
    func parameterDocComments() -> [Swift.Line] {
        var comments: [Swift.Line] = []
        comments += Swift.Line.linesWith(requiredContent: self.description ?? "No documentation available for `\(self.name)`")
        
        if !self.arguments.isEmpty {
            comments += ""
            comments += "- parameters:"
            for arg in self.arguments {
                let description = arg.description ?? "No documentation"
                comments += Swift.Line(content: "    - \(arg.name): \(description)")
            }
            comments += ""
        }
        return comments
    }
    
    func parameters(isInterface: Bool, valueType: Bool) -> [Swift.Method.Parameter] {
        return self.arguments.map {
            $0.methodParameter(useDefaultValues: !isInterface, valueType: valueType)
        }
    }
}
