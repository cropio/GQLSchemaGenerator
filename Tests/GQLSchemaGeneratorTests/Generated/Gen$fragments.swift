import Foundation

import GQLSchema

public final class GQLFilmConnectionFragment: GraphQLFragment {

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

public final class GQLPageInfoFragment: GraphQLFragment {

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

public final class GQLFilmEdgeFragment: GraphQLFragment {

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

public final class GQLFilmFragment: GraphQLFragment {

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

public final class GQLPersonConnectionFragment: GraphQLFragment {

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

public final class GQLPersonEdgeFragment: GraphQLFragment {

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
public final class GQLPersonFragment: GraphQLFragment {

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
public final class GQLPlanetFragment: GraphQLFragment {

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

public final class GQLHeroConnectionFragment: GraphQLFragment {

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

public final class GQLHeroEdgeFragment: GraphQLFragment {

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

/// A hero created by fans
public final class GQLHeroFragment: GraphQLFragment {

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

public final class GQLSpecieConnectionFragment: GraphQLFragment {

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

public final class GQLSpecieEdgeFragment: GraphQLFragment {

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

/// A type of person or character within the Star Wars Universe.
public final class GQLSpecieFragment: GraphQLFragment {

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

public final class GQLStarshipConnectionFragment: GraphQLFragment {

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

public final class GQLStarshipEdgeFragment: GraphQLFragment {

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

/// A single transport craft that has hyperdrive capability.
public final class GQLStarshipFragment: GraphQLFragment {

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

public final class GQLVehicleConnectionFragment: GraphQLFragment {

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

public final class GQLVehicleEdgeFragment: GraphQLFragment {

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
public final class GQLVehicleFragment: GraphQLFragment {

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

public final class GQLPlanetConnectionFragment: GraphQLFragment {

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

public final class GQLPlanetEdgeFragment: GraphQLFragment {

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

public final class GQLDjangoDebugFragment: GraphQLFragment {

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

public final class GQLDjangoDebugSQLFragment: GraphQLFragment {

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

public final class GQLCreateHeroPayloadFragment: GraphQLFragment {

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
