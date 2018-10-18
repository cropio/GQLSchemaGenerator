import Foundation

import GQLSchema

/// A single transport craft that has hyperdrive capability.
public final class StarshipFragment: GraphQLFragment {

    public static var typeName: String {
        return "Starship"
    }

    private(set) public var name: String
    private(set) public var field: GQLStarship
    public required init(name: String, field: GQLStarship) {
        self.name = name
        self.field = field
    }
}

public final class FilmFragment: GraphQLFragment {

    public static var typeName: String {
        return "Film"
    }

    private(set) public var name: String
    private(set) public var field: GQLFilm
    public required init(name: String, field: GQLFilm) {
        self.name = name
        self.field = field
    }
}

public final class FilmEdgeFragment: GraphQLFragment {

    public static var typeName: String {
        return "FilmEdge"
    }

    private(set) public var name: String
    private(set) public var field: GQLFilmEdge
    public required init(name: String, field: GQLFilmEdge) {
        self.name = name
        self.field = field
    }
}

public final class PersonConnectionFragment: GraphQLFragment {

    public static var typeName: String {
        return "PersonConnection"
    }

    private(set) public var name: String
    private(set) public var field: GQLPersonConnection
    public required init(name: String, field: GQLPersonConnection) {
        self.name = name
        self.field = field
    }
}

public final class PersonEdgeFragment: GraphQLFragment {

    public static var typeName: String {
        return "PersonEdge"
    }

    private(set) public var name: String
    private(set) public var field: GQLPersonEdge
    public required init(name: String, field: GQLPersonEdge) {
        self.name = name
        self.field = field
    }
}

/// An individual person or character within the Star Wars universe.
public final class PersonFragment: GraphQLFragment {

    public static var typeName: String {
        return "Person"
    }

    private(set) public var name: String
    private(set) public var field: GQLPerson
    public required init(name: String, field: GQLPerson) {
        self.name = name
        self.field = field
    }
}

/// A large mass, planet or planetoid in the Star Wars Universe,
///     at the time of 0 ABY.
public final class PlanetFragment: GraphQLFragment {

    public static var typeName: String {
        return "Planet"
    }

    private(set) public var name: String
    private(set) public var field: GQLPlanet
    public required init(name: String, field: GQLPlanet) {
        self.name = name
        self.field = field
    }
}

public final class PageInfoFragment: GraphQLFragment {

    public static var typeName: String {
        return "PageInfo"
    }

    private(set) public var name: String
    private(set) public var field: GQLPageInfo
    public required init(name: String, field: GQLPageInfo) {
        self.name = name
        self.field = field
    }
}

public final class HeroConnectionFragment: GraphQLFragment {

    public static var typeName: String {
        return "HeroConnection"
    }

    private(set) public var name: String
    private(set) public var field: GQLHeroConnection
    public required init(name: String, field: GQLHeroConnection) {
        self.name = name
        self.field = field
    }
}

/// A hero created by fans
public final class HeroFragment: GraphQLFragment {

    public static var typeName: String {
        return "Hero"
    }

    private(set) public var name: String
    private(set) public var field: GQLHero
    public required init(name: String, field: GQLHero) {
        self.name = name
        self.field = field
    }
}

public final class HeroEdgeFragment: GraphQLFragment {

    public static var typeName: String {
        return "HeroEdge"
    }

    private(set) public var name: String
    private(set) public var field: GQLHeroEdge
    public required init(name: String, field: GQLHeroEdge) {
        self.name = name
        self.field = field
    }
}

/// A type of person or character within the Star Wars Universe.
public final class SpecieFragment: GraphQLFragment {

    public static var typeName: String {
        return "Specie"
    }

    private(set) public var name: String
    private(set) public var field: GQLSpecie
    public required init(name: String, field: GQLSpecie) {
        self.name = name
        self.field = field
    }
}

public final class SpecieConnectionFragment: GraphQLFragment {

    public static var typeName: String {
        return "SpecieConnection"
    }

    private(set) public var name: String
    private(set) public var field: GQLSpecieConnection
    public required init(name: String, field: GQLSpecieConnection) {
        self.name = name
        self.field = field
    }
}

public final class StarshipEdgeFragment: GraphQLFragment {

    public static var typeName: String {
        return "StarshipEdge"
    }

    private(set) public var name: String
    private(set) public var field: GQLStarshipEdge
    public required init(name: String, field: GQLStarshipEdge) {
        self.name = name
        self.field = field
    }
}

public final class SpecieEdgeFragment: GraphQLFragment {

    public static var typeName: String {
        return "SpecieEdge"
    }

    private(set) public var name: String
    private(set) public var field: GQLSpecieEdge
    public required init(name: String, field: GQLSpecieEdge) {
        self.name = name
        self.field = field
    }
}

public final class VehicleConnectionFragment: GraphQLFragment {

    public static var typeName: String {
        return "VehicleConnection"
    }

    private(set) public var name: String
    private(set) public var field: GQLVehicleConnection
    public required init(name: String, field: GQLVehicleConnection) {
        self.name = name
        self.field = field
    }
}

public final class VehicleEdgeFragment: GraphQLFragment {

    public static var typeName: String {
        return "VehicleEdge"
    }

    private(set) public var name: String
    private(set) public var field: GQLVehicleEdge
    public required init(name: String, field: GQLVehicleEdge) {
        self.name = name
        self.field = field
    }
}

/// A single transport craft that does not have hyperdrive capability
public final class VehicleFragment: GraphQLFragment {

    public static var typeName: String {
        return "Vehicle"
    }

    private(set) public var name: String
    private(set) public var field: GQLVehicle
    public required init(name: String, field: GQLVehicle) {
        self.name = name
        self.field = field
    }
}

public final class StarshipConnectionFragment: GraphQLFragment {

    public static var typeName: String {
        return "StarshipConnection"
    }

    private(set) public var name: String
    private(set) public var field: GQLStarshipConnection
    public required init(name: String, field: GQLStarshipConnection) {
        self.name = name
        self.field = field
    }
}

public final class PlanetEdgeFragment: GraphQLFragment {

    public static var typeName: String {
        return "PlanetEdge"
    }

    private(set) public var name: String
    private(set) public var field: GQLPlanetEdge
    public required init(name: String, field: GQLPlanetEdge) {
        self.name = name
        self.field = field
    }
}

public final class DjangoDebugFragment: GraphQLFragment {

    public static var typeName: String {
        return "DjangoDebug"
    }

    private(set) public var name: String
    private(set) public var field: GQLDjangoDebug
    public required init(name: String, field: GQLDjangoDebug) {
        self.name = name
        self.field = field
    }
}

public final class DjangoDebugSQLFragment: GraphQLFragment {

    public static var typeName: String {
        return "DjangoDebugSQL"
    }

    private(set) public var name: String
    private(set) public var field: GQLDjangoDebugSQL
    public required init(name: String, field: GQLDjangoDebugSQL) {
        self.name = name
        self.field = field
    }
}

public final class CreateHeroPayloadFragment: GraphQLFragment {

    public static var typeName: String {
        return "CreateHeroPayload"
    }

    private(set) public var name: String
    private(set) public var field: GQLCreateHeroPayload
    public required init(name: String, field: GQLCreateHeroPayload) {
        self.name = name
        self.field = field
    }
}

public final class FilmConnectionFragment: GraphQLFragment {

    public static var typeName: String {
        return "FilmConnection"
    }

    private(set) public var name: String
    private(set) public var field: GQLFilmConnection
    public required init(name: String, field: GQLFilmConnection) {
        self.name = name
        self.field = field
    }
}

public final class PlanetConnectionFragment: GraphQLFragment {

    public static var typeName: String {
        return "PlanetConnection"
    }

    private(set) public var name: String
    private(set) public var field: GQLPlanetConnection
    public required init(name: String, field: GQLPlanetConnection) {
        self.name = name
        self.field = field
    }
}
