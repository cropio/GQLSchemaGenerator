import Foundation

import GQLSchema

public final class GQLFilmConnection: GraphQLField {

    /// No documentation available for `edges`
    @discardableResult
    public func edges(alias _alias: String? = nil, _ buildOn: (GQLFilmEdge) -> Void) -> GQLFilmConnection {
        let field = GQLFilmEdge(name: "edges", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `pageInfo`
    @discardableResult
    public func pageInfo(alias _alias: String? = nil, _ buildOn: (GQLPageInfo) -> Void) -> GQLFilmConnection {
        let field = GQLPageInfo(name: "pageInfo", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `totalCount`
    ///  - Value Type: `Int!`
    public var totalCount: GQLFilmConnection {
        let field = GraphQLField(name: "totalCount", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLPageInfo: GraphQLField {

    /// When paginating forwards, the cursor to continue.
    ///  - Value Type: `String!`
    public var endCursor: GQLPageInfo {
        let field = GraphQLField(name: "endCursor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// When paginating forwards, are there more items?
    ///  - Value Type: `Bool`
    public var hasNextPage: GQLPageInfo {
        let field = GraphQLField(name: "hasNextPage", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// When paginating backwards, are there more items?
    ///  - Value Type: `Bool`
    public var hasPreviousPage: GQLPageInfo {
        let field = GraphQLField(name: "hasPreviousPage", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// When paginating backwards, the cursor to continue.
    ///  - Value Type: `String!`
    public var startCursor: GQLPageInfo {
        let field = GraphQLField(name: "startCursor", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLFilmEdge: GraphQLField {

    /// A cursor for use in pagination
    ///  - Value Type: `String`
    public var cursor: GQLFilmEdge {
        let field = GraphQLField(name: "cursor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// The item at the end of the edge
    @discardableResult
    public func node(alias _alias: String? = nil, _ buildOn: (GQLFilm) -> Void) -> GQLFilmEdge {
        let field = GQLFilm(name: "node", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

public final class GQLFilm: GraphQLField, GQLNode {

    /// No documentation available for `characters`
    /// 
    /// - parameters:
    ///     - name: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func characters(alias _alias: String? = nil, name: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLPersonConnection) -> Void) -> GQLFilm {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPersonConnection(name: "characters", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    ///  - Value Type: `String`
    public var director: GQLFilm {
        let field = GraphQLField(name: "director", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `Int`
    public var episodeId: GQLFilm {
        let field = GraphQLField(name: "episodeId", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `films`
    /// 
    /// - parameters:
    ///     - episodeId_Gt: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func films(alias _alias: String? = nil, episodeId_Gt: GraphQLValue<Float>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLFilmConnection) -> Void) -> GQLFilm {
        var parameters: [GraphQLParameter] = []
        
        if let arg = episodeId_Gt { parameters.append(GraphQLParameter(name: "episodeId_Gt", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLFilmConnection(name: "films", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// The ID of the object.
    ///  - Value Type: `ID`
    public var id: GQLFilm {
        let field = GraphQLField(name: "id", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var openingCrawl: GQLFilm {
        let field = GraphQLField(name: "openingCrawl", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `planets`
    /// 
    /// - parameters:
    ///     - name: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func planets(alias _alias: String? = nil, name: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLPlanetConnection) -> Void) -> GQLFilm {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPlanetConnection(name: "planets", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `producers`
    ///  - Value Type: `[String?]!`
    public var producers: GQLFilm {
        let field = GraphQLField(name: "producers", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `DateTime`
    public var releaseDate: GQLFilm {
        let field = GraphQLField(name: "releaseDate", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `species`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func species(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLSpecieConnection) -> Void) -> GQLFilm {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLSpecieConnection(name: "species", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `starships`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func starships(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLStarshipConnection) -> Void) -> GQLFilm {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLStarshipConnection(name: "starships", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    ///  - Value Type: `String`
    public var title: GQLFilm {
        let field = GraphQLField(name: "title", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `vehicles`
    /// 
    /// - parameters:
    ///     - name_Startswith: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func vehicles(alias _alias: String? = nil, name_Startswith: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLVehicleConnection) -> Void) -> GQLFilm {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLVehicleConnection(name: "vehicles", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

public final class GQLPersonConnection: GraphQLField {

    /// No documentation available for `edges`
    @discardableResult
    public func edges(alias _alias: String? = nil, _ buildOn: (GQLPersonEdge) -> Void) -> GQLPersonConnection {
        let field = GQLPersonEdge(name: "edges", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `pageInfo`
    @discardableResult
    public func pageInfo(alias _alias: String? = nil, _ buildOn: (GQLPageInfo) -> Void) -> GQLPersonConnection {
        let field = GQLPageInfo(name: "pageInfo", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `totalCount`
    ///  - Value Type: `Int!`
    public var totalCount: GQLPersonConnection {
        let field = GraphQLField(name: "totalCount", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLPersonEdge: GraphQLField {

    /// A cursor for use in pagination
    ///  - Value Type: `String`
    public var cursor: GQLPersonEdge {
        let field = GraphQLField(name: "cursor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// The item at the end of the edge
    @discardableResult
    public func node(alias _alias: String? = nil, _ buildOn: (GQLPerson) -> Void) -> GQLPersonEdge {
        let field = GQLPerson(name: "node", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

/// An individual person or character within the Star Wars universe.
public final class GQLPerson: GraphQLField, GQLNode {

    ///  - Value Type: `String`
    public var birthYear: GQLPerson {
        let field = GraphQLField(name: "birthYear", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var eyeColor: GQLPerson {
        let field = GraphQLField(name: "eyeColor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `films`
    /// 
    /// - parameters:
    ///     - episodeId_Gt: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func films(alias _alias: String? = nil, episodeId_Gt: GraphQLValue<Float>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLFilmConnection) -> Void) -> GQLPerson {
        var parameters: [GraphQLParameter] = []
        
        if let arg = episodeId_Gt { parameters.append(GraphQLParameter(name: "episodeId_Gt", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLFilmConnection(name: "films", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    ///  - Value Type: `String`
    public var gender: GQLPerson {
        let field = GraphQLField(name: "gender", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var hairColor: GQLPerson {
        let field = GraphQLField(name: "hairColor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var height: GQLPerson {
        let field = GraphQLField(name: "height", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    @discardableResult
    public func homeworld(alias _alias: String? = nil, _ buildOn: (GQLPlanet) -> Void) -> GQLPerson {
        let field = GQLPlanet(name: "homeworld", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// The ID of the object.
    ///  - Value Type: `ID`
    public var id: GQLPerson {
        let field = GraphQLField(name: "id", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var mass: GQLPerson {
        let field = GraphQLField(name: "mass", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var name: GQLPerson {
        let field = GraphQLField(name: "name", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var skinColor: GQLPerson {
        let field = GraphQLField(name: "skinColor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `species`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func species(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLSpecieConnection) -> Void) -> GQLPerson {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLSpecieConnection(name: "species", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `starships`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func starships(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLStarshipConnection) -> Void) -> GQLPerson {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLStarshipConnection(name: "starships", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `vehicles`
    /// 
    /// - parameters:
    ///     - name_Startswith: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func vehicles(alias _alias: String? = nil, name_Startswith: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLVehicleConnection) -> Void) -> GQLPerson {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLVehicleConnection(name: "vehicles", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

/// A large mass, planet or planetoid in the Star Wars Universe,
///     at the time of 0 ABY.
public final class GQLPlanet: GraphQLField, GQLNode {

    /// No documentation available for `climates`
    ///  - Value Type: `[String?]!`
    public var climates: GQLPlanet {
        let field = GraphQLField(name: "climates", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var diameter: GQLPlanet {
        let field = GraphQLField(name: "diameter", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `films`
    /// 
    /// - parameters:
    ///     - episodeId_Gt: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func films(alias _alias: String? = nil, episodeId_Gt: GraphQLValue<Float>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLFilmConnection) -> Void) -> GQLPlanet {
        var parameters: [GraphQLParameter] = []
        
        if let arg = episodeId_Gt { parameters.append(GraphQLParameter(name: "episodeId_Gt", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLFilmConnection(name: "films", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    ///  - Value Type: `String`
    public var gravity: GQLPlanet {
        let field = GraphQLField(name: "gravity", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `heroes`
    /// 
    /// - parameters:
    ///     - name_Contains: Filter
    ///     - name_Startswith: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func heroes(alias _alias: String? = nil, name_Contains: GraphQLValue<String>? = nil, name_Startswith: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLHeroConnection) -> Void) -> GQLPlanet {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Contains { parameters.append(GraphQLParameter(name: "name_Contains", value: arg)) }
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLHeroConnection(name: "heroes", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// The ID of the object.
    ///  - Value Type: `ID`
    public var id: GQLPlanet {
        let field = GraphQLField(name: "id", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var name: GQLPlanet {
        let field = GraphQLField(name: "name", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var orbitalPeriod: GQLPlanet {
        let field = GraphQLField(name: "orbitalPeriod", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var population: GQLPlanet {
        let field = GraphQLField(name: "population", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `residents`
    /// 
    /// - parameters:
    ///     - name: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func residents(alias _alias: String? = nil, name: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLPersonConnection) -> Void) -> GQLPlanet {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPersonConnection(name: "residents", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    ///  - Value Type: `String`
    public var rotationPeriod: GQLPlanet {
        let field = GraphQLField(name: "rotationPeriod", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `species`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func species(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLSpecieConnection) -> Void) -> GQLPlanet {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLSpecieConnection(name: "species", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    ///  - Value Type: `String`
    public var surfaceWater: GQLPlanet {
        let field = GraphQLField(name: "surfaceWater", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `terrains`
    ///  - Value Type: `[String?]!`
    public var terrains: GQLPlanet {
        let field = GraphQLField(name: "terrains", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLHeroConnection: GraphQLField {

    /// No documentation available for `edges`
    @discardableResult
    public func edges(alias _alias: String? = nil, _ buildOn: (GQLHeroEdge) -> Void) -> GQLHeroConnection {
        let field = GQLHeroEdge(name: "edges", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `pageInfo`
    @discardableResult
    public func pageInfo(alias _alias: String? = nil, _ buildOn: (GQLPageInfo) -> Void) -> GQLHeroConnection {
        let field = GQLPageInfo(name: "pageInfo", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `totalCount`
    ///  - Value Type: `Int!`
    public var totalCount: GQLHeroConnection {
        let field = GraphQLField(name: "totalCount", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLHeroEdge: GraphQLField {

    /// A cursor for use in pagination
    ///  - Value Type: `String`
    public var cursor: GQLHeroEdge {
        let field = GraphQLField(name: "cursor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// The item at the end of the edge
    @discardableResult
    public func node(alias _alias: String? = nil, _ buildOn: (GQLHero) -> Void) -> GQLHeroEdge {
        let field = GQLHero(name: "node", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

/// A hero created by fans
public final class GQLHero: GraphQLField, GQLNode {

    @discardableResult
    public func homeworld(alias _alias: String? = nil, _ buildOn: (GQLPlanet) -> Void) -> GQLHero {
        let field = GQLPlanet(name: "homeworld", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// The ID of the object.
    ///  - Value Type: `ID`
    public var id: GQLHero {
        let field = GraphQLField(name: "id", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var name: GQLHero {
        let field = GraphQLField(name: "name", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLSpecieConnection: GraphQLField {

    /// No documentation available for `edges`
    @discardableResult
    public func edges(alias _alias: String? = nil, _ buildOn: (GQLSpecieEdge) -> Void) -> GQLSpecieConnection {
        let field = GQLSpecieEdge(name: "edges", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `pageInfo`
    @discardableResult
    public func pageInfo(alias _alias: String? = nil, _ buildOn: (GQLPageInfo) -> Void) -> GQLSpecieConnection {
        let field = GQLPageInfo(name: "pageInfo", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `totalCount`
    ///  - Value Type: `Int!`
    public var totalCount: GQLSpecieConnection {
        let field = GraphQLField(name: "totalCount", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLSpecieEdge: GraphQLField {

    /// A cursor for use in pagination
    ///  - Value Type: `String`
    public var cursor: GQLSpecieEdge {
        let field = GraphQLField(name: "cursor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// The item at the end of the edge
    @discardableResult
    public func node(alias _alias: String? = nil, _ buildOn: (GQLSpecie) -> Void) -> GQLSpecieEdge {
        let field = GQLSpecie(name: "node", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

/// A type of person or character within the Star Wars Universe.
public final class GQLSpecie: GraphQLField, GQLNode {

    ///  - Value Type: `String`
    public var averageHeight: GQLSpecie {
        let field = GraphQLField(name: "averageHeight", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var averageLifespan: GQLSpecie {
        let field = GraphQLField(name: "averageLifespan", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var classification: GQLSpecie {
        let field = GraphQLField(name: "classification", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var designation: GQLSpecie {
        let field = GraphQLField(name: "designation", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `eyeColors`
    ///  - Value Type: `[String?]!`
    public var eyeColors: GQLSpecie {
        let field = GraphQLField(name: "eyeColors", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `films`
    /// 
    /// - parameters:
    ///     - episodeId_Gt: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func films(alias _alias: String? = nil, episodeId_Gt: GraphQLValue<Float>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLFilmConnection) -> Void) -> GQLSpecie {
        var parameters: [GraphQLParameter] = []
        
        if let arg = episodeId_Gt { parameters.append(GraphQLParameter(name: "episodeId_Gt", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLFilmConnection(name: "films", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `hairColors`
    ///  - Value Type: `[String?]!`
    public var hairColors: GQLSpecie {
        let field = GraphQLField(name: "hairColors", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    @discardableResult
    public func homeworld(alias _alias: String? = nil, _ buildOn: (GQLPlanet) -> Void) -> GQLSpecie {
        let field = GQLPlanet(name: "homeworld", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// The ID of the object.
    ///  - Value Type: `ID`
    public var id: GQLSpecie {
        let field = GraphQLField(name: "id", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var language: GQLSpecie {
        let field = GraphQLField(name: "language", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var name: GQLSpecie {
        let field = GraphQLField(name: "name", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `people`
    /// 
    /// - parameters:
    ///     - name: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func people(alias _alias: String? = nil, name: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLPersonConnection) -> Void) -> GQLSpecie {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPersonConnection(name: "people", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `skinColors`
    ///  - Value Type: `[String?]!`
    public var skinColors: GQLSpecie {
        let field = GraphQLField(name: "skinColors", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `species`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func species(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLSpecieConnection) -> Void) -> GQLSpecie {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLSpecieConnection(name: "species", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

public final class GQLStarshipConnection: GraphQLField {

    /// No documentation available for `edges`
    @discardableResult
    public func edges(alias _alias: String? = nil, _ buildOn: (GQLStarshipEdge) -> Void) -> GQLStarshipConnection {
        let field = GQLStarshipEdge(name: "edges", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `pageInfo`
    @discardableResult
    public func pageInfo(alias _alias: String? = nil, _ buildOn: (GQLPageInfo) -> Void) -> GQLStarshipConnection {
        let field = GQLPageInfo(name: "pageInfo", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `totalCount`
    ///  - Value Type: `Int!`
    public var totalCount: GQLStarshipConnection {
        let field = GraphQLField(name: "totalCount", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLStarshipEdge: GraphQLField {

    /// A cursor for use in pagination
    ///  - Value Type: `String`
    public var cursor: GQLStarshipEdge {
        let field = GraphQLField(name: "cursor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// The item at the end of the edge
    @discardableResult
    public func node(alias _alias: String? = nil, _ buildOn: (GQLStarship) -> Void) -> GQLStarshipEdge {
        let field = GQLStarship(name: "node", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

/// A single transport craft that has hyperdrive capability.
public final class GQLStarship: GraphQLField, GQLNode {

    ///  - Value Type: `String`
    public var MGLT: GQLStarship {
        let field = GraphQLField(name: "MGLT", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var cargoCapacity: GQLStarship {
        let field = GraphQLField(name: "cargoCapacity", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var consumables: GQLStarship {
        let field = GraphQLField(name: "consumables", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var costInCredits: GQLStarship {
        let field = GraphQLField(name: "costInCredits", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var crew: GQLStarship {
        let field = GraphQLField(name: "crew", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `films`
    /// 
    /// - parameters:
    ///     - episodeId_Gt: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func films(alias _alias: String? = nil, episodeId_Gt: GraphQLValue<Float>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLFilmConnection) -> Void) -> GQLStarship {
        var parameters: [GraphQLParameter] = []
        
        if let arg = episodeId_Gt { parameters.append(GraphQLParameter(name: "episodeId_Gt", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLFilmConnection(name: "films", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    ///  - Value Type: `String`
    public var hyperdriveRating: GQLStarship {
        let field = GraphQLField(name: "hyperdriveRating", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// The ID of the object.
    ///  - Value Type: `ID`
    public var id: GQLStarship {
        let field = GraphQLField(name: "id", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var length: GQLStarship {
        let field = GraphQLField(name: "length", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var manufacturer: GQLStarship {
        let field = GraphQLField(name: "manufacturer", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `manufacturers`
    ///  - Value Type: `[String?]!`
    public var manufacturers: GQLStarship {
        let field = GraphQLField(name: "manufacturers", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var maxAtmospheringSpeed: GQLStarship {
        let field = GraphQLField(name: "maxAtmospheringSpeed", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var model: GQLStarship {
        let field = GraphQLField(name: "model", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var name: GQLStarship {
        let field = GraphQLField(name: "name", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var passengers: GQLStarship {
        let field = GraphQLField(name: "passengers", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `pilots`
    /// 
    /// - parameters:
    ///     - name: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func pilots(alias _alias: String? = nil, name: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLPersonConnection) -> Void) -> GQLStarship {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPersonConnection(name: "pilots", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    ///  - Value Type: `String`
    public var starshipClass: GQLStarship {
        let field = GraphQLField(name: "starshipClass", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `starships`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func starships(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLStarshipConnection) -> Void) -> GQLStarship {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLStarshipConnection(name: "starships", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

public final class GQLVehicleConnection: GraphQLField {

    /// No documentation available for `edges`
    @discardableResult
    public func edges(alias _alias: String? = nil, _ buildOn: (GQLVehicleEdge) -> Void) -> GQLVehicleConnection {
        let field = GQLVehicleEdge(name: "edges", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `pageInfo`
    @discardableResult
    public func pageInfo(alias _alias: String? = nil, _ buildOn: (GQLPageInfo) -> Void) -> GQLVehicleConnection {
        let field = GQLPageInfo(name: "pageInfo", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `totalCount`
    ///  - Value Type: `Int!`
    public var totalCount: GQLVehicleConnection {
        let field = GraphQLField(name: "totalCount", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLVehicleEdge: GraphQLField {

    /// A cursor for use in pagination
    ///  - Value Type: `String`
    public var cursor: GQLVehicleEdge {
        let field = GraphQLField(name: "cursor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// The item at the end of the edge
    @discardableResult
    public func node(alias _alias: String? = nil, _ buildOn: (GQLVehicle) -> Void) -> GQLVehicleEdge {
        let field = GQLVehicle(name: "node", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

/// A single transport craft that does not have hyperdrive capability
public final class GQLVehicle: GraphQLField, GQLNode {

    ///  - Value Type: `String`
    public var cargoCapacity: GQLVehicle {
        let field = GraphQLField(name: "cargoCapacity", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var consumables: GQLVehicle {
        let field = GraphQLField(name: "consumables", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var costInCredits: GQLVehicle {
        let field = GraphQLField(name: "costInCredits", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var crew: GQLVehicle {
        let field = GraphQLField(name: "crew", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `films`
    /// 
    /// - parameters:
    ///     - episodeId_Gt: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func films(alias _alias: String? = nil, episodeId_Gt: GraphQLValue<Float>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLFilmConnection) -> Void) -> GQLVehicle {
        var parameters: [GraphQLParameter] = []
        
        if let arg = episodeId_Gt { parameters.append(GraphQLParameter(name: "episodeId_Gt", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLFilmConnection(name: "films", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// The ID of the object.
    ///  - Value Type: `ID`
    public var id: GQLVehicle {
        let field = GraphQLField(name: "id", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var length: GQLVehicle {
        let field = GraphQLField(name: "length", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var manufacturer: GQLVehicle {
        let field = GraphQLField(name: "manufacturer", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `manufacturers`
    ///  - Value Type: `[String?]!`
    public var manufacturers: GQLVehicle {
        let field = GraphQLField(name: "manufacturers", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var maxAtmospheringSpeed: GQLVehicle {
        let field = GraphQLField(name: "maxAtmospheringSpeed", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var model: GQLVehicle {
        let field = GraphQLField(name: "model", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var name: GQLVehicle {
        let field = GraphQLField(name: "name", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    ///  - Value Type: `String`
    public var passengers: GQLVehicle {
        let field = GraphQLField(name: "passengers", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `pilots`
    /// 
    /// - parameters:
    ///     - name: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func pilots(alias _alias: String? = nil, name: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLPersonConnection) -> Void) -> GQLVehicle {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPersonConnection(name: "pilots", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    ///  - Value Type: `String`
    public var vehicleClass: GQLVehicle {
        let field = GraphQLField(name: "vehicleClass", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `vehicles`
    /// 
    /// - parameters:
    ///     - name_Startswith: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    @discardableResult
    public func vehicles(alias _alias: String? = nil, name_Startswith: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLVehicleConnection) -> Void) -> GQLVehicle {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLVehicleConnection(name: "vehicles", alias: _alias, parameters: parameters)
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

public final class GQLPlanetConnection: GraphQLField {

    /// No documentation available for `edges`
    @discardableResult
    public func edges(alias _alias: String? = nil, _ buildOn: (GQLPlanetEdge) -> Void) -> GQLPlanetConnection {
        let field = GQLPlanetEdge(name: "edges", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `pageInfo`
    @discardableResult
    public func pageInfo(alias _alias: String? = nil, _ buildOn: (GQLPageInfo) -> Void) -> GQLPlanetConnection {
        let field = GQLPageInfo(name: "pageInfo", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `totalCount`
    ///  - Value Type: `Int!`
    public var totalCount: GQLPlanetConnection {
        let field = GraphQLField(name: "totalCount", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLPlanetEdge: GraphQLField {

    /// A cursor for use in pagination
    ///  - Value Type: `String`
    public var cursor: GQLPlanetEdge {
        let field = GraphQLField(name: "cursor", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// The item at the end of the edge
    @discardableResult
    public func node(alias _alias: String? = nil, _ buildOn: (GQLPlanet) -> Void) -> GQLPlanetEdge {
        let field = GQLPlanet(name: "node", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

public final class GQLDjangoDebug: GraphQLField {

    /// No documentation available for `sql`
    @discardableResult
    public func sql(alias _alias: String? = nil, _ buildOn: (GQLDjangoDebugSQL) -> Void) -> GQLDjangoDebug {
        let field = GQLDjangoDebugSQL(name: "sql", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }
}

public final class GQLDjangoDebugSQL: GraphQLField {

    /// No documentation available for `alias`
    ///  - Value Type: `String!`
    public var alias: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "alias", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `duration`
    ///  - Value Type: `Float!`
    public var duration: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "duration", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `encoding`
    ///  - Value Type: `String!`
    public var encoding: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "encoding", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `isSelect`
    ///  - Value Type: `Bool!`
    public var isSelect: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "isSelect", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `isSlow`
    ///  - Value Type: `Bool!`
    public var isSlow: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "isSlow", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `isoLevel`
    ///  - Value Type: `String!`
    public var isoLevel: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "isoLevel", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `params`
    ///  - Value Type: `String!`
    public var params: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "params", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `rawSql`
    ///  - Value Type: `String!`
    public var rawSql: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "rawSql", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `sql`
    ///  - Value Type: `String!`
    public var sql: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "sql", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `startTime`
    ///  - Value Type: `Float!`
    public var startTime: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "startTime", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `stopTime`
    ///  - Value Type: `Float!`
    public var stopTime: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "stopTime", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `transId`
    ///  - Value Type: `String!`
    public var transId: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "transId", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `transStatus`
    ///  - Value Type: `String!`
    public var transStatus: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "transStatus", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `vendor`
    ///  - Value Type: `String!`
    public var vendor: GQLDjangoDebugSQL {
        let field = GraphQLField(name: "vendor", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

public final class GQLCreateHeroPayload: GraphQLField {

    /// No documentation available for `clientMutationId`
    ///  - Value Type: `String!`
    public var clientMutationId: GQLCreateHeroPayload {
        let field = GraphQLField(name: "clientMutationId", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// No documentation available for `hero`
    @discardableResult
    public func hero(alias _alias: String? = nil, _ buildOn: (GQLHero) -> Void) -> GQLCreateHeroPayload {
        let field = GQLHero(name: "hero", alias: _alias, parameters: [])
        try! self._add(child: field)
        
        buildOn(field)
        
        return self
    }

    /// No documentation available for `ok`
    ///  - Value Type: `Bool!`
    public var ok: GQLCreateHeroPayload {
        let field = GraphQLField(name: "ok", parameters: [])
        try! self._add(child: field)
        
        return self
    }
}

/// An object with an ID
/// 
/// ## Implementing types:
///  - `GQLFilm`
///  - `GQLPerson`
///  - `GQLPlanet`
///  - `GQLHero`
///  - `GQLSpecie`
///  - `GQLStarship`
///  - `GQLVehicle`
public protocol GQLNode {

    /// The ID of the object.
    ///  - Value Type: `ID`
    var id: Self {
        get
    }
}

/// Concrete type auto-generated for `GQLNode`
public final class GQLConcreteNode: GraphQLTypedField, GQLNode {

    /// The ID of the object.
    ///  - Value Type: `ID`
    public var id: GQLConcreteNode {
        let field = GraphQLField(name: "id", parameters: [])
        try! self._add(child: field)
        
        return self
    }

    /// Use an inline fragment to query specific fields of `GQLFilm`
    @discardableResult
    public func onFilm(_ buildOn: (GQLFilm) -> Void) -> GQLConcreteNode {
        let field    = GQLFilm(name: "", parameters: [])
        let fragment = GraphQLInlineFragment(type: "Film")
        
        try! self._add(child: fragment)
        
        buildOn(field)
        try! fragment._add(children: field._children)
        
        return self
    }

    /// Use an inline fragment to query specific fields of `GQLPerson`
    @discardableResult
    public func onPerson(_ buildOn: (GQLPerson) -> Void) -> GQLConcreteNode {
        let field    = GQLPerson(name: "", parameters: [])
        let fragment = GraphQLInlineFragment(type: "Person")
        
        try! self._add(child: fragment)
        
        buildOn(field)
        try! fragment._add(children: field._children)
        
        return self
    }

    /// Use an inline fragment to query specific fields of `GQLPlanet`
    @discardableResult
    public func onPlanet(_ buildOn: (GQLPlanet) -> Void) -> GQLConcreteNode {
        let field    = GQLPlanet(name: "", parameters: [])
        let fragment = GraphQLInlineFragment(type: "Planet")
        
        try! self._add(child: fragment)
        
        buildOn(field)
        try! fragment._add(children: field._children)
        
        return self
    }

    /// Use an inline fragment to query specific fields of `GQLHero`
    @discardableResult
    public func onHero(_ buildOn: (GQLHero) -> Void) -> GQLConcreteNode {
        let field    = GQLHero(name: "", parameters: [])
        let fragment = GraphQLInlineFragment(type: "Hero")
        
        try! self._add(child: fragment)
        
        buildOn(field)
        try! fragment._add(children: field._children)
        
        return self
    }

    /// Use an inline fragment to query specific fields of `GQLSpecie`
    @discardableResult
    public func onSpecie(_ buildOn: (GQLSpecie) -> Void) -> GQLConcreteNode {
        let field    = GQLSpecie(name: "", parameters: [])
        let fragment = GraphQLInlineFragment(type: "Specie")
        
        try! self._add(child: fragment)
        
        buildOn(field)
        try! fragment._add(children: field._children)
        
        return self
    }

    /// Use an inline fragment to query specific fields of `GQLStarship`
    @discardableResult
    public func onStarship(_ buildOn: (GQLStarship) -> Void) -> GQLConcreteNode {
        let field    = GQLStarship(name: "", parameters: [])
        let fragment = GraphQLInlineFragment(type: "Starship")
        
        try! self._add(child: fragment)
        
        buildOn(field)
        try! fragment._add(children: field._children)
        
        return self
    }

    /// Use an inline fragment to query specific fields of `GQLVehicle`
    @discardableResult
    public func onVehicle(_ buildOn: (GQLVehicle) -> Void) -> GQLConcreteNode {
        let field    = GQLVehicle(name: "", parameters: [])
        let fragment = GraphQLInlineFragment(type: "Vehicle")
        
        try! self._add(child: fragment)
        
        buildOn(field)
        try! fragment._add(children: field._children)
        
        return self
    }
}
