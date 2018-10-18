import Foundation

import GQLSchema

public final class GQLQuery {

    /// No documentation available for `allFilms`
    /// 
    /// - parameters:
    ///     - episodeId_Gt: Filter
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allFilms(episodeId_Gt: Float? = nil, before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, _ buildOn: (GQLFilmConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = episodeId_Gt { parameters.append(GraphQLParameter(name: "episodeId_Gt", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLFilmConnection(name: "allFilms", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
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
    public static func allFilms(episodeId_Gt: Float? = nil, before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, fragment: FilmConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = episodeId_Gt { parameters.append(GraphQLParameter(name: "episodeId_Gt", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLFilmConnection(name: "allFilms", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }

    /// No documentation available for `allSpecies`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allSpecies(before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, _ buildOn: (GQLSpecieConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLSpecieConnection(name: "allSpecies", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
    }

    /// No documentation available for `allSpecies`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allSpecies(before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, fragment: SpecieConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLSpecieConnection(name: "allSpecies", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
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
    public static func allCharacters(name: String? = nil, before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, _ buildOn: (GQLPersonConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPersonConnection(name: "allCharacters", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
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
    public static func allCharacters(name: String? = nil, before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, fragment: PersonConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPersonConnection(name: "allCharacters", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
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
    public static func allVehicles(name_Startswith: String? = nil, before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, _ buildOn: (GQLVehicleConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLVehicleConnection(name: "allVehicles", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
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
    public static func allVehicles(name_Startswith: String? = nil, before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, fragment: VehicleConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLVehicleConnection(name: "allVehicles", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
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
    public static func allPlanets(name: String? = nil, before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, _ buildOn: (GQLPlanetConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPlanetConnection(name: "allPlanets", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
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
    public static func allPlanets(name: String? = nil, before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, fragment: PlanetConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name { parameters.append(GraphQLParameter(name: "name", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLPlanetConnection(name: "allPlanets", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }

    /// No documentation available for `allStarships`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allStarships(before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, _ buildOn: (GQLStarshipConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLStarshipConnection(name: "allStarships", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
    }

    /// No documentation available for `allStarships`
    /// 
    /// - parameters:
    ///     - before: No documentation
    ///     - after: No documentation
    ///     - first: No documentation
    ///     - last: No documentation
    /// 
    public static func allStarships(before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, fragment: StarshipConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLStarshipConnection(name: "allStarships", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
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
    public static func allHeroes(name_Contains: String? = nil, name_Startswith: String? = nil, before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, _ buildOn: (GQLHeroConnection) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Contains { parameters.append(GraphQLParameter(name: "name_Contains", value: arg)) }
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLHeroConnection(name: "allHeroes", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
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
    public static func allHeroes(name_Contains: String? = nil, name_Startswith: String? = nil, before: String? = nil, after: String? = nil, first: Int? = nil, last: Int? = nil, fragment: HeroConnectionFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        if let arg = name_Contains { parameters.append(GraphQLParameter(name: "name_Contains", value: arg)) }
        if let arg = name_Startswith { parameters.append(GraphQLParameter(name: "name_Startswith", value: arg)) }
        if let arg = before { parameters.append(GraphQLParameter(name: "before", value: arg)) }
        if let arg = after { parameters.append(GraphQLParameter(name: "after", value: arg)) }
        if let arg = first { parameters.append(GraphQLParameter(name: "first", value: arg)) }
        if let arg = last { parameters.append(GraphQLParameter(name: "last", value: arg)) }
        
        let field = GQLHeroConnection(name: "allHeroes", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func film(id: ID, _ buildOn: (GQLFilm) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLFilm(name: "film", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func film(id: ID, fragment: FilmFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLFilm(name: "film", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func specie(id: ID, _ buildOn: (GQLSpecie) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLSpecie(name: "specie", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func specie(id: ID, fragment: SpecieFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLSpecie(name: "specie", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func character(id: ID, _ buildOn: (GQLPerson) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLPerson(name: "character", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func character(id: ID, fragment: PersonFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLPerson(name: "character", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func vehicle(id: ID, _ buildOn: (GQLVehicle) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLVehicle(name: "vehicle", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func vehicle(id: ID, fragment: VehicleFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLVehicle(name: "vehicle", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func planet(id: ID, _ buildOn: (GQLPlanet) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLPlanet(name: "planet", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func planet(id: ID, fragment: PlanetFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLPlanet(name: "planet", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func starship(id: ID, _ buildOn: (GQLStarship) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLStarship(name: "starship", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func starship(id: ID, fragment: StarshipFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLStarship(name: "starship", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func hero(id: ID, _ buildOn: (GQLHero) -> Void) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLHero(name: "hero", parameters: parameters)
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
    }

    /// The ID of the object
    /// 
    /// - parameters:
    ///     - id: No documentation
    /// 
    public static func hero(id: ID, fragment: HeroFragment) -> GraphQLQuery {
        var parameters: [GraphQLParameter] = []
        
        parameters.append(GraphQLParameter(name: "id", value: id))
        
        let field = GQLHero(name: "hero", parameters: parameters)
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }

    /// No documentation available for `__debug`
    public static func __debug(_ buildOn: (GQLDjangoDebug) -> Void) -> GraphQLQuery {
        let field = GQLDjangoDebug(name: "__debug", parameters: [])
        buildOn(field)
        
        return GraphQLQuery(body: field._graphQLFormat)
    }

    /// No documentation available for `__debug`
    public static func __debug(fragment: DjangoDebugFragment) -> GraphQLQuery {
        let field = GQLDjangoDebug(name: "__debug", parameters: [])
        field.fragment(fragment)
        
        return GraphQLQuery(body: field._graphQLFormat, fragment: fragment)
    }
}

public final class GQLMutation {

    /// No documentation available for `createHero`
    public static func createHero(_ buildOn: (GQLCreateHeroPayload) -> Void) -> GraphQLMutation {
        let field = GQLCreateHeroPayload(name: "createHero", parameters: [])
        buildOn(field)
        
        return GraphQLMutation(body: field._graphQLFormat)
    }

    /// No documentation available for `createHero`
    public static func createHero(fragment: CreateHeroPayloadFragment) -> GraphQLMutation {
        let field = GQLCreateHeroPayload(name: "createHero", parameters: [])
        field.fragment(fragment)
        
        return GraphQLMutation(body: field._graphQLFormat, fragment: fragment)
    }
}
