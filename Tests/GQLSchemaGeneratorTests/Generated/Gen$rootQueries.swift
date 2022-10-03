import Foundation

import GQLSchema

public final class GQLQuery {

    /// No documentation available for `__debug`
    public static func __debug(alias _alias: String? = nil, _ buildOn: (GQLDjangoDebug) -> Void) -> GraphQLQuery {
        let field = GQLDjangoDebug(name: "__debug", alias: _alias, parameters: [])
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// No documentation available for `__debug`
    public static func __debug(alias _alias: String? = nil, fragment: GQLDjangoDebugFragment) -> GraphQLQuery {
        let field = GQLDjangoDebug(name: "__debug", parameters: [])
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// No documentation available for `allCharacters`
    /// 
    /// - parameters:
    ///     - name: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allCharacters(alias _alias: String? = nil, name: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLPersonConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPersonConnection(name: "allCharacters", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// No documentation available for `allCharacters`
    /// 
    /// - parameters:
    ///     - name: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allCharacters(alias _alias: String? = nil, name: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, fragment: GQLPersonConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPersonConnection(name: "allCharacters", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// No documentation available for `allFilms`
    /// 
    /// - parameters:
    ///     - episodeId_Gt: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allFilms(alias _alias: String? = nil, episodeId_Gt: GraphQLValue<Float>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLFilmConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = episodeId_Gt { parameters.append(GraphQLParameter(name: "episodeId_Gt", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLFilmConnection(name: "allFilms", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// No documentation available for `allFilms`
    /// 
    /// - parameters:
    ///     - episodeId_Gt: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allFilms(alias _alias: String? = nil, episodeId_Gt: GraphQLValue<Float>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, fragment: GQLFilmConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = episodeId_Gt { parameters.append(GraphQLParameter(name: "episodeId_Gt", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLFilmConnection(name: "allFilms", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// No documentation available for `allHeroes`
    /// 
    /// - parameters:
    ///     - name_Contains: Filter
    ///     - name_Startswith: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allHeroes(alias _alias: String? = nil, name_Contains: GraphQLValue<String>? = nil, name_Startswith: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLHeroConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Contains { parameters.append(GraphQLParameter(name: "name_Contains", value: arg)) }
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLHeroConnection(name: "allHeroes", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// No documentation available for `allHeroes`
    /// 
    /// - parameters:
    ///     - name_Contains: Filter
    ///     - name_Startswith: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allHeroes(alias _alias: String? = nil, name_Contains: GraphQLValue<String>? = nil, name_Startswith: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, fragment: GQLHeroConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Contains { parameters.append(GraphQLParameter(name: "name_Contains", value: arg)) }
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLHeroConnection(name: "allHeroes", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// No documentation available for `allPlanets`
    /// 
    /// - parameters:
    ///     - name: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allPlanets(alias _alias: String? = nil, name: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLPlanetConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPlanetConnection(name: "allPlanets", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// No documentation available for `allPlanets`
    /// 
    /// - parameters:
    ///     - name: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allPlanets(alias _alias: String? = nil, name: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, fragment: GQLPlanetConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPlanetConnection(name: "allPlanets", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// No documentation available for `allSpecies`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allSpecies(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLSpecieConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLSpecieConnection(name: "allSpecies", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// No documentation available for `allSpecies`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allSpecies(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, fragment: GQLSpecieConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLSpecieConnection(name: "allSpecies", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// No documentation available for `allStarships`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allStarships(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLStarshipConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLStarshipConnection(name: "allStarships", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// No documentation available for `allStarships`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allStarships(alias _alias: String? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, fragment: GQLStarshipConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLStarshipConnection(name: "allStarships", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// No documentation available for `allVehicles`
    /// 
    /// - parameters:
    ///     - name_Startswith: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allVehicles(alias _alias: String? = nil, name_Startswith: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, _ buildOn: (GQLVehicleConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLVehicleConnection(name: "allVehicles", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// No documentation available for `allVehicles`
    /// 
    /// - parameters:
    ///     - name_Startswith: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allVehicles(alias _alias: String? = nil, name_Startswith: GraphQLValue<String>? = nil, before: GraphQLValue<String>? = nil, after: GraphQLValue<String>? = nil, first: GraphQLValue<Int>? = nil, last: GraphQLValue<Int>? = nil, fragment: GQLVehicleConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLVehicleConnection(name: "allVehicles", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func character(alias _alias: String? = nil, id: GraphQLValue<ID>, _ buildOn: (GQLPerson) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLPerson(name: "character", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func character(alias _alias: String? = nil, id: GraphQLValue<ID>, fragment: GQLPersonFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLPerson(name: "character", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func film(alias _alias: String? = nil, id: GraphQLValue<ID>, _ buildOn: (GQLFilm) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLFilm(name: "film", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func film(alias _alias: String? = nil, id: GraphQLValue<ID>, fragment: GQLFilmFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLFilm(name: "film", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func hero(alias _alias: String? = nil, id: GraphQLValue<ID>, _ buildOn: (GQLHero) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLHero(name: "hero", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func hero(alias _alias: String? = nil, id: GraphQLValue<ID>, fragment: GQLHeroFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLHero(name: "hero", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func planet(alias _alias: String? = nil, id: GraphQLValue<ID>, _ buildOn: (GQLPlanet) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLPlanet(name: "planet", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func planet(alias _alias: String? = nil, id: GraphQLValue<ID>, fragment: GQLPlanetFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLPlanet(name: "planet", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func specie(alias _alias: String? = nil, id: GraphQLValue<ID>, _ buildOn: (GQLSpecie) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLSpecie(name: "specie", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func specie(alias _alias: String? = nil, id: GraphQLValue<ID>, fragment: GQLSpecieFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLSpecie(name: "specie", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func starship(alias _alias: String? = nil, id: GraphQLValue<ID>, _ buildOn: (GQLStarship) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLStarship(name: "starship", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func starship(alias _alias: String? = nil, id: GraphQLValue<ID>, fragment: GQLStarshipFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLStarship(name: "starship", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func vehicle(alias _alias: String? = nil, id: GraphQLValue<ID>, _ buildOn: (GQLVehicle) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLVehicle(name: "vehicle", alias: _alias, parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(field: field)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func vehicle(alias _alias: String? = nil, id: GraphQLValue<ID>, fragment: GQLVehicleFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLVehicle(name: "vehicle", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(field: field, fragment: fragment)
    }
}

public final class GQLMutation {

    /// No documentation available for `createHero`
    public static func createHero(alias _alias: String? = nil, _ buildOn: (GQLCreateHeroPayload) -> Void) -> GraphQLMutation {
        let field = GQLCreateHeroPayload(name: "createHero", alias: _alias, parameters: [])
        buildOn(field)
        
        return GraphQLMutation(field: field)
    }

    /// No documentation available for `createHero`
    public static func createHero(alias _alias: String? = nil, fragment: GQLCreateHeroPayloadFragment) -> GraphQLMutation {
        let field = GQLCreateHeroPayload(name: "createHero", parameters: [])
        field.fragment(fragment)
        
        return GraphQLMutation(field: field, fragment: fragment)
    }
}
