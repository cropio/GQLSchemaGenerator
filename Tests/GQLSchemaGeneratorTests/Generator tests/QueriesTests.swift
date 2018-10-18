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
        let string = "allStarships(before: \"some\" after: \"some\" first: 10 last: 0){ edges{ node{ films(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } pilots(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } starships(before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } } } } "
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.queryType, .query)
        XCTAssertNil(query.fragmentQuery)
        
        let query2 = GQLQuery.starship(id: "10") { _ = $0
            .id
        }
        
        let string2 = "starship(id: \"10\"){ id } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.queryType, .query)
        XCTAssertNil(query2.fragmentQuery)
    }
    
    func testGQLStarshipFragment() {
        let fragment = StarshipConnectionFragment { _ = $0
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
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.queryType, .query)
        
        
        let fragment2 = StarshipFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.starship(id: "10", fragment: fragment2)
        
        let string2 = "starship(id: \"10\"){ ...StarshipFragment } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.queryType, .query)
    }

    func testGQLHeroes() {
        let query = GQLQuery.allHeroes(name_Contains: "some", name_Startswith: "some", before: "some", after: "some", first: 10, last: 0) { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .id
                }
            }
        }
        let string = "allHeroes(name_Contains: \"some\" name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ edges{ node{ id } } } "
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.queryType, .query)
        XCTAssertNil(query.fragmentQuery)
        
        let query2 = GQLQuery.hero(id: "10") { _ = $0
            .id
        }
        
        let string2 = "hero(id: \"10\"){ id } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.queryType, .query)
        XCTAssertNil(query2.fragmentQuery)
    }
    
    func testGQLHeroesFragment() {
        let fragment = HeroConnectionFragment { _ = $0
            .edges { _ = $0
                .node { _ = $0
                    .id
                }
            }
        }
        let query = GQLQuery.allHeroes(name_Contains: "some", name_Startswith: "some", before: "some", after: "some", first: 10, last: 0, fragment: fragment)
        let string = "allHeroes(name_Contains: \"some\" name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ ...HeroConnectionFragment } "
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.queryType, .query)
        
        
        let fragment2 = HeroFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.hero(id: "10", fragment: fragment2)
        
        let string2 = "hero(id: \"10\"){ ...HeroFragment } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.queryType, .query)
    }

    func testGQLFilm() {
        let query = GQLQuery.allFilms(episodeId_Gt: 10, before: "some", after: "some", first: 10, last: 0) { _ = $0
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
        let string = "allFilms(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 0){ edges{ node{ characters(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } films(episodeId_Gt: 10.0 before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } planets(name: \"some\" before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } species(before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } starships(before: \"some\" after: \"some\" first: 10 last: 0){ totalCount } vehicles(name_Startswith: \"some\" before: \"some\" after: \"some\" first: 10 last: 10){ totalCount } } } } "
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.queryType, .query)
        XCTAssertNil(query.fragmentQuery)
        
        let query2 = GQLQuery.film(id: "10") { _ = $0
            .id
        }
        
        let string2 = "film(id: \"10\"){ id } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.queryType, .query)
        XCTAssertNil(query2.fragmentQuery)
    }
    
    func testGQLFilmFragment() {
        let fragment = FilmConnectionFragment { _ = $0
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
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.queryType, .query)
        
        
        let fragment2 = FilmFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.film(id: "10", fragment: fragment2)
        
        let string2 = "film(id: \"10\"){ ...FilmFragment } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.queryType, .query)
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
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.queryType, .query)
        XCTAssertNil(query.fragmentQuery)
        
        let query2 = GQLQuery.character(id: "10") { _ = $0
            .id
        }
        
        let string2 = "character(id: \"10\"){ id } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.queryType, .query)
        XCTAssertNil(query2.fragmentQuery)
    }
    
    func testGQLPersonFragment() {
        let fragment = PersonConnectionFragment { _ = $0
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
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.queryType, .query)
        
        
        let fragment2 = PersonFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.character(id: "10", fragment: fragment2)
        
        let string2 = "character(id: \"10\"){ ...PersonFragment } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.queryType, .query)
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
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.queryType, .query)
        XCTAssertNil(query.fragmentQuery)
        
        let query2 = GQLQuery.planet(id: "10") { _ = $0
            .id
        }
        
        let string2 = "planet(id: \"10\"){ id } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.queryType, .query)
        XCTAssertNil(query2.fragmentQuery)
    }
    
    func testGQLPlanetFragment() {
        let fragment = PlanetConnectionFragment { _ = $0
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
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.queryType, .query)
        
        
        let fragment2 = PlanetFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.planet(id: "10", fragment: fragment2)
        
        let string2 = "planet(id: \"10\"){ ...PlanetFragment } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.queryType, .query)
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
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.queryType, .query)
        XCTAssertNil(query.fragmentQuery)
        
        let query2 = GQLQuery.specie(id: "10") { _ = $0
            .id
        }
        
        let string2 = "specie(id: \"10\"){ id } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.queryType, .query)
        XCTAssertNil(query2.fragmentQuery)
    }
    
    func testGQLSpecieFragment() {
        let fragment = SpecieConnectionFragment { _ = $0
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
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.queryType, .query)
        
        
        let fragment2 = SpecieFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.specie(id: "10", fragment: fragment2)
        
        let string2 = "specie(id: \"10\"){ ...SpecieFragment } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.queryType, .query)
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
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.queryType, .query)
        XCTAssertNil(query.fragmentQuery)
        
        let query2 = GQLQuery.vehicle(id: "10") { _ = $0
            .id
        }
        
        let string2 = "vehicle(id: \"10\"){ id } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.queryType, .query)
        XCTAssertNil(query2.fragmentQuery)
    }
    
    func testGQLVehicleFragment() {
        let fragment = VehicleConnectionFragment { _ = $0
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
        XCTAssertEqual(query.body, string)
        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
        XCTAssertEqual(query.queryType, .query)
        
        
        let fragment2 = VehicleFragment { _ = $0
            .id
        }
        let query2 = GQLQuery.vehicle(id: "10", fragment: fragment2)
        
        let string2 = "vehicle(id: \"10\"){ ...VehicleFragment } "
        
        XCTAssertEqual(query2.body, string2)
        XCTAssertEqual(query2.fragmentQuery?.body, fragment2.description)
        XCTAssertEqual(query2.queryType, .query)
    }
}
