//
//  QueriesTests.swift
//  GQLSchemaGeneratorTests
//
//  Created by Evgeny Kalashnikov on 10/18/18.
//

import XCTest

class QueriesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGQLStarship() {
        let query = GQLQuery.allStarships(before: "some", after: "some", first: 10, last: 0) { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .films(alias: "alias", episodeId_Gt: 10.0, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .pilots(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .starships(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                }
            }
        }
        let string = "allStarships(before: \"some\" after: \"some\" first: 10 last: 0){ edges{ node{ alias: films(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } pilots(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } starships(before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } } } } "
        XCTAssertEqual(query.name, "allStarships")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.type, .query)
        XCTAssertNil(query.fragmentQuery)

        let query2 = GQLQuery.starship(alias: "alias", id: "10") { _ = $0
            .id
        }

        let string2 = "alias: starship(id: \"10\"){ id } "

        XCTAssertEqual(query2.name, "alias")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.type, .query)
        XCTAssertNil(query2.fragmentQuery)
    }

    func testGQLStarshipFragment() {
        let fragment = GQLStarshipConnectionFragment { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .films(episodeId_Gt: 10.0, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .pilots(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .starships(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                }
            }
        }
        let query = GQLQuery.allStarships(before: "some", after: "some", first: 10, last: 0, fragment: fragment)
        let string = "allStarships(before: \"some\" after: \"some\" first: 10 last: 0){ ...StarshipConnectionFragment } "

        XCTAssertEqual(query.name, "allStarships")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.type, .query)


        let fragment2 = GQLStarshipFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.starship(id: "10", fragment: fragment2)

        let string2 = "starship(id: \"10\"){ ...StarshipFragment } "

        XCTAssertEqual(query2.name, "starship")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.type, .query)
    }

    func testGQLHeroes() {
        let query = GQLQuery.allHeroes(alias: "alias", name_Contains: "some", name_Startswith: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .id
                }
            }
        }
        let string = "alias: allHeroes(name_Contains: \"some\" name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ edges{ node{ id } } } "

        XCTAssertEqual(query.name, "alias")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.type, .query)
        XCTAssertNil(query.fragmentQuery)

        let query2 = GQLQuery.hero(id: "10") { _ = $0
            .id
        }

        let string2 = "hero(id: \"10\"){ id } "

        XCTAssertEqual(query2.name, "hero")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.type, .query)
        XCTAssertNil(query2.fragmentQuery)
    }

    func testGQLHeroesFragment() {
        let fragment = GQLHeroConnectionFragment { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .id
                }
            }
        }
        let query = GQLQuery.allHeroes(name_Contains: "some", name_Startswith: "some", before: "some", after: "some", first: 10, last: 0, fragment: fragment)
        let string = "allHeroes(name_Contains: \"some\" name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ ...HeroConnectionFragment } "

        XCTAssertEqual(query.name, "allHeroes")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.type, .query)


        let fragment2 = GQLHeroFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.hero(id: "10", fragment: fragment2)

        let string2 = "hero(id: \"10\"){ ...HeroFragment } "

        XCTAssertEqual(query2.name, "hero")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.type, .query)
    }

    func testGQLFilm() {
        let query = GQLQuery.allFilms(alias: "alias", episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .characters(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .films(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .planets(alias: "alias", name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .species(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .starships(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .vehicles(name_Startswith: "some", before: "some", after: "some", first: 10, last: 10) { _ = $0
                        .totalCount
                    }
                }
            }
        }
        let string = "alias: allFilms(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 0){ edges{ node{ characters(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } films(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } alias: planets(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } species(before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } starships(before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } vehicles(name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 10){ totalCount } } } } "

        XCTAssertEqual(query.name, "alias")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.type, .query)
        XCTAssertNil(query.fragmentQuery)

        let query2 = GQLQuery.film(id: "10") { _ = $0
            .id
        }

        let string2 = "film(id: \"10\"){ id } "

        XCTAssertEqual(query2.name, "film")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.type, .query)
        XCTAssertNil(query2.fragmentQuery)
    }

    func testGQLFilmFragment() {
        let fragment = GQLFilmConnectionFragment { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .characters(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .films(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .planets(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .species(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .starships(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .vehicles(name_Startswith: "some", before: "some", after: "some", first: 10, last: 10) { _ = $0
                        .totalCount
                    }
                }
            }
        }

        let query = GQLQuery.allFilms(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 10, fragment: fragment)
        let string = "allFilms(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 10){ ...FilmConnectionFragment } "

        XCTAssertEqual(query.name, "allFilms")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.type, .query)


        let fragment2 = GQLFilmFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.film(id: "10", fragment: fragment2)

        let string2 = "film(id: \"10\"){ ...FilmFragment } "

        XCTAssertEqual(query2.name, "film")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.type, .query)
    }

    func testGQLPerson() {
        let query = GQLQuery.allCharacters(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .films(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .species(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .starships(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .vehicles(name_Startswith: "some", before: "some", after: "some", first: 10, last: 10) { _ = $0
                        .totalCount
                    }
                    .homeworld { _ = $0
                        .id
                    }
                }
            }
        }
        let string = "allCharacters(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ edges{ node{ films(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } species(before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } starships(before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } vehicles(name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 10){ totalCount } homeworld{ id } } } } "

        XCTAssertEqual(query.name, "allCharacters")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.type, .query)
        XCTAssertNil(query.fragmentQuery)

        let query2 = GQLQuery.character(id: "10") { _ = $0
            .id
        }

        let string2 = "character(id: \"10\"){ id } "

        XCTAssertEqual(query2.name, "character")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.type, .query)
        XCTAssertNil(query2.fragmentQuery)
    }

    func testGQLPersonFragment() {
        let fragment = GQLPersonConnectionFragment { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .films(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .species(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .starships(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .vehicles(name_Startswith: "some", before: "some", after: "some", first: 10, last: 10) { _ = $0
                        .totalCount
                    }
                    .homeworld { _ = $0
                        .id
                    }
                }
            }
        }

        let query = GQLQuery.allCharacters(name: "some", before: "some", after: "some", first: 10, last: 0, fragment: fragment)
        let string = "allCharacters(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ ...PersonConnectionFragment } "

        XCTAssertEqual(query.name, "allCharacters")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.type, .query)


        let fragment2 = GQLPersonFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.character(id: "10", fragment: fragment2)

        let string2 = "character(id: \"10\"){ ...PersonFragment } "

        XCTAssertEqual(query2.name, "character")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.type, .query)
    }

    func testGQLPlanet() {
        let query = GQLQuery.allPlanets(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .films(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .heroes(name_Contains: "some", name_Startswith: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .residents(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .species(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                }
            }
        }

        let string = "allPlanets(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ edges{ node{ films(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } heroes(name_Contains: \"some\" name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } residents(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } species(before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } } } } "

        XCTAssertEqual(query.name, "allPlanets")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.type, .query)
        XCTAssertNil(query.fragmentQuery)

        let query2 = GQLQuery.planet(id: "10") { _ = $0
            .id
        }

        let string2 = "planet(id: \"10\"){ id } "

        XCTAssertEqual(query2.name, "planet")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.type, .query)
        XCTAssertNil(query2.fragmentQuery)
    }

    func testGQLPlanetFragment() {
        let fragment = GQLPlanetConnectionFragment { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .films(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .heroes(name_Contains: "some", name_Startswith: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .residents(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .species(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                }
            }
        }
        let query = GQLQuery.allPlanets(name: "some", before: "some", after: "some", first: 10, last: 0, fragment: fragment)
        let string = "allPlanets(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ ...PlanetConnectionFragment } "

        XCTAssertEqual(query.name, "allPlanets")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.type, .query)


        let fragment2 = GQLPlanetFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.planet(id: "10", fragment: fragment2)

        let string2 = "planet(id: \"10\"){ ...PlanetFragment } "

        XCTAssertEqual(query2.name, "planet")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.type, .query)
    }

    func testGQLSpecie() {
        let query = GQLQuery.allSpecies(before: "some", after: "some", first: 10, last: 0) { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .films(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .homeworld { _ = $0
                        .id
                    }
                    .people(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .species(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                }
            }
        }
        let string = "allSpecies(before: \"some\" after: \"some\" first: 10 last: 0){ edges{ node{ films(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } homeworld{ id } people(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } species(before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } } } } "

        XCTAssertEqual(query.name, "allSpecies")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.type, .query)
        XCTAssertNil(query.fragmentQuery)

        let query2 = GQLQuery.specie(id: "10") { _ = $0
            .id
        }

        let string2 = "specie(id: \"10\"){ id } "

        XCTAssertEqual(query2.name, "specie")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.type, .query)
        XCTAssertNil(query2.fragmentQuery)
    }

    func testGQLSpecieFragment() {
        let fragment = GQLSpecieConnectionFragment { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .films(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .homeworld { _ = $0
                        .id
                    }
                    .people(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .species(before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                }
            }
        }
        let query = GQLQuery.allSpecies(before: "some", after: "some", first: 10, last: 0, fragment: fragment)

        let string = "allSpecies(before: \"some\" after: \"some\" first: 10 last: 0){ ...SpecieConnectionFragment } "

        XCTAssertEqual(query.name, "allSpecies")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.type, .query)


        let fragment2 = GQLSpecieFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.specie(id: "10", fragment: fragment2)

        let string2 = "specie(id: \"10\"){ ...SpecieFragment } "

        XCTAssertEqual(query2.name, "specie")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.type, .query)
    }

    func testGQLVehicle() {
        let query = GQLQuery.allVehicles(name_Startswith: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .films(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .pilots(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .vehicles(name_Startswith: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                }
            }
        }

        let string = "allVehicles(name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ edges{ node{ films(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } pilots(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } vehicles(name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } } } } "

        XCTAssertEqual(query.name, "allVehicles")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.type, .query)
        XCTAssertNil(query.fragmentQuery)

        let query2 = GQLQuery.vehicle(id: "10") { _ = $0
            .id
        }

        let string2 = "vehicle(id: \"10\"){ id } "

        XCTAssertEqual(query2.name, "vehicle")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.type, .query)
        XCTAssertNil(query2.fragmentQuery)
    }

    func testGQLVehicleFragment() {
        let fragment = GQLVehicleConnectionFragment { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .films(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .pilots(name: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                    .vehicles(name_Startswith: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
                        .totalCount
                    }
                }
            }
        }
        let query = GQLQuery.allVehicles(name_Startswith: "some", before: "some", after: "some", first: 10, last: 0, fragment: fragment)

        let string = "allVehicles(name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ ...VehicleConnectionFragment } "

        XCTAssertEqual(query.name, "allVehicles")
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.type, .query)


        let fragment2 = GQLVehicleFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.vehicle(id: "10", fragment: fragment2)

        let string2 = "vehicle(id: \"10\"){ ...VehicleFragment } "

        XCTAssertEqual(query2.name, "vehicle")
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.type, .query)
    }
}
