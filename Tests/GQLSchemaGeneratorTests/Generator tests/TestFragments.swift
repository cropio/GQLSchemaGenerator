//
//  TestFragments.swift
//  GQLSchemaGeneratorTests
//
//  Created by Evgeny Kalashnikov on 10/18/18.
//

import XCTest

class TestFragments: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStarshipFragment() {
        let fragment = GQLStarshipFragment { _ = $0
            .cargoCapacity
            .consumables
            .costInCredits
            .hyperdriveRating
            .id
            .length
            .manufacturer
            .manufacturers
            .maxAtmospheringSpeed
            .MGLT
            .model
            .name
            .passengers
            .starshipClass
            .crew
        }
        
        let string = "fragment StarshipFragment on Starship{ cargoCapacity consumables costInCredits hyperdriveRating id length manufacturer manufacturers maxAtmospheringSpeed MGLT model name passengers starshipClass crew } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testFilmFragment() {
        let fragment = GQLFilmFragment { _ = $0
            .director
            .episodeId
            .id
            .openingCrawl
            .producers
            .releaseDate
            .title
        }
        let string = "fragment FilmFragment on Film{ director episodeId id openingCrawl producers releaseDate title } "
        XCTAssertEqual(fragment.description, string)
    }

    func testFilmEdgeFragment() {
        let fragment = GQLFilmEdgeFragment { _ = $0
            .cursor
            .node { _ = $0
                .director
                .episodeId
                .id
                .openingCrawl
                .producers
                .releaseDate
                .title
            }
        }
        let string = "fragment FilmEdgeFragment on FilmEdge{ cursor node{ director episodeId id openingCrawl producers releaseDate title } } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testPersonConnectionFragment() {
        let fragment = GQLPersonConnectionFragment { _ = $0
            .totalCount
            .edges { _ = $0
                .cursor
                .node {_ = $0
                    .birthYear
                    .eyeColor
                    .gender
                    .hairColor
                    .height
                    .id
                    .mass
                    .name
                    .skinColor
                }
            }
            .pageInfo { _ = $0
                .endCursor
                .hasNextPage
                .hasPreviousPage
                .startCursor
            }
        }
        let string = "fragment PersonConnectionFragment on PersonConnection{ totalCount edges{ cursor node{ birthYear eyeColor gender hairColor height id mass name skinColor } } pageInfo{ endCursor hasNextPage hasPreviousPage startCursor } } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testPersonEdgeFragment() {
        let fragment = GQLPersonEdgeFragment { _ = $0
            .cursor
            .node {_ = $0
                .birthYear
                .eyeColor
                .gender
                .hairColor
                .height
                .id
                .mass
                .name
                .skinColor
            }
        }
        let string = "fragment PersonEdgeFragment on PersonEdge{ cursor node{ birthYear eyeColor gender hairColor height id mass name skinColor } } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testPersonFragment() {
        let fragment = GQLPersonFragment { _ = $0
            .birthYear
            .eyeColor
            .gender
            .hairColor
            .height
            .id
            .mass
            .name
            .skinColor
        }
        let string = "fragment PersonFragment on Person{ birthYear eyeColor gender hairColor height id mass name skinColor } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testPlanetFragment() {
        let fragment = GQLPlanetFragment { _ = $0
            .climates
            .diameter
            .gravity
            .id
            .name
            .orbitalPeriod
            .population
            .rotationPeriod
            .surfaceWater
            .terrains
        }
        let string = "fragment PlanetFragment on Planet{ climates diameter gravity id name orbitalPeriod population rotationPeriod surfaceWater terrains } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testPageInfoFragment() {
        let fragment = GQLPageInfoFragment { _ = $0
            .endCursor
            .hasNextPage
            .hasPreviousPage
            .startCursor
        }
        let string = "fragment PageInfoFragment on PageInfo{ endCursor hasNextPage hasPreviousPage startCursor } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testHeroConnectionFragment() {
        let fragment = GQLHeroConnectionFragment { _ = $0
            .totalCount
            .edges { _ = $0
                .cursor
                .node { _ =  $0
                    .id
                    .name
                }
            }
            .pageInfo { _ = $0
                .endCursor
                .hasNextPage
                .hasPreviousPage
                .startCursor
            }
        }
        let string = "fragment HeroConnectionFragment on HeroConnection{ totalCount edges{ cursor node{ id name } } pageInfo{ endCursor hasNextPage hasPreviousPage startCursor } } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testHeroFragment() {
        let fragment = GQLHeroFragment { _ = $0
            .id
            .name
            .homeworld { _ = $0
                .climates
                .diameter
                .gravity
                .id
                .name
                .orbitalPeriod
                .population
                .rotationPeriod
                .surfaceWater
                .terrains
            }
        }
        let string = "fragment HeroFragment on Hero{ id name homeworld{ climates diameter gravity id name orbitalPeriod population rotationPeriod surfaceWater terrains } } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testHeroEdgeFragment() {
        let fragment = GQLHeroEdgeFragment { _ = $0
            .cursor
            .node { _ = $0
                .id
                .name
            }
        }
        let string = "fragment HeroEdgeFragment on HeroEdge{ cursor node{ id name } } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testSpecieFragment() {
        let fragment = GQLSpecieFragment { _ = $0
            .averageHeight
            .averageLifespan
            .classification
            .designation
            .eyeColors
            .hairColors
            .id
            .language
            .name
            .skinColors
            .homeworld { _ = $0
                .name
            }
        }
        let string = "fragment SpecieFragment on Specie{ averageHeight averageLifespan classification designation eyeColors hairColors id language name skinColors homeworld{ name } } "
        XCTAssertEqual(fragment.description, string)
    }

    func testSpecieConnectionFragment() {
        let fragment = GQLSpecieConnectionFragment { _ = $0
            .totalCount
            .edges { _ = $0
                .cursor
                .node { _ = $0
                    .averageHeight
                    .averageLifespan
                    .classification
                    .designation
                    .eyeColors
                    .hairColors
                    .id
                    .language
                    .name
                    .skinColors
                }
            }
            .pageInfo { _ = $0
                .endCursor
                .hasNextPage
                .hasPreviousPage
                .startCursor
            }
        }
        let string = "fragment SpecieConnectionFragment on SpecieConnection{ totalCount edges{ cursor node{ averageHeight averageLifespan classification designation eyeColors hairColors id language name skinColors } } pageInfo{ endCursor hasNextPage hasPreviousPage startCursor } } "
        XCTAssertEqual(fragment.description, string)
    }

    func testStarshipEdgeFragment() {
        let fragment = GQLStarshipEdgeFragment { _ = $0
            .cursor
            .node { _ = $0
                .cargoCapacity
                .consumables
                .costInCredits
                .crew
                .hyperdriveRating
                .id
                .length
                .manufacturer
                .manufacturers
                .manufacturers
                .maxAtmospheringSpeed
                .MGLT
                .model
                .name
                .passengers
                .starshipClass
            }
        }
        let string = "fragment StarshipEdgeFragment on StarshipEdge{ cursor node{ cargoCapacity consumables costInCredits crew hyperdriveRating id length manufacturer manufacturers manufacturers maxAtmospheringSpeed MGLT model name passengers starshipClass } } "
        XCTAssertEqual(fragment.description, string)
    }

    func testSpecieEdgeFragment() {
        let fragment = GQLSpecieEdgeFragment { _ = $0
            .cursor
            .node { _ = $0
                .averageHeight
                .averageLifespan
                .classification
                .designation
                .eyeColors
                .hairColors
                .id
                .language
                .name
                .skinColors
            }
        }
        let string = "fragment SpecieEdgeFragment on SpecieEdge{ cursor node{ averageHeight averageLifespan classification designation eyeColors hairColors id language name skinColors } } "
        XCTAssertEqual(fragment.description, string)
    }

    func testVehicleConnectionFragment() {
        let fragment = GQLVehicleConnectionFragment { _ = $0
            .totalCount
            .edges { _ = $0
                .cursor
                .node { _ = $0
                    .cargoCapacity
                    .consumables
                    .costInCredits
                    .crew
                    .id
                    .length
                    .manufacturer
                    .manufacturers
                    .maxAtmospheringSpeed
                    .model
                    .name
                    .passengers
                    .vehicleClass
                }
            }
            .pageInfo { _ = $0
                .endCursor
                .hasNextPage
                .hasPreviousPage
                .startCursor
            }
        }
        let string = "fragment VehicleConnectionFragment on VehicleConnection{ totalCount edges{ cursor node{ cargoCapacity consumables costInCredits crew id length manufacturer manufacturers maxAtmospheringSpeed model name passengers vehicleClass } } pageInfo{ endCursor hasNextPage hasPreviousPage startCursor } } "
        XCTAssertEqual(fragment.description, string)
    }

    func testVehicleEdgeFragment() {
        let fragment = GQLVehicleEdgeFragment { _ = $0
            .cursor
            .node { _ = $0
                .cargoCapacity
                .consumables
                .costInCredits
                .crew
                .id
                .length
                .manufacturer
                .manufacturers
                .maxAtmospheringSpeed
                .model
                .name
                .passengers
                .vehicleClass
            }
        }
        let string = "fragment VehicleEdgeFragment on VehicleEdge{ cursor node{ cargoCapacity consumables costInCredits crew id length manufacturer manufacturers maxAtmospheringSpeed model name passengers vehicleClass } } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testVehicleFragment() {
        let fragment = GQLVehicleFragment { _ = $0
            .cargoCapacity
            .consumables
            .costInCredits
            .crew
            .id
            .length
            .manufacturer
            .manufacturers
            .maxAtmospheringSpeed
            .model
            .name
            .passengers
            .vehicleClass
        }
        let string = "fragment VehicleFragment on Vehicle{ cargoCapacity consumables costInCredits crew id length manufacturer manufacturers maxAtmospheringSpeed model name passengers vehicleClass } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testStarshipConnectionFragment() {
        let fragment = GQLStarshipConnectionFragment { _ = $0
            .totalCount
            .edges { _ = $0
                .cursor
                .node { _ = $0
                    .cargoCapacity
                    .consumables
                    .costInCredits
                    .crew
                    .hyperdriveRating
                    .id
                    .length
                    .manufacturer
                    .manufacturers
                    .manufacturers
                    .maxAtmospheringSpeed
                    .MGLT
                    .model
                    .name
                    .passengers
                    .starshipClass
                }
            }
            .pageInfo { _ = $0
                .endCursor
                .hasNextPage
                .hasPreviousPage
                .startCursor
            }
        }
        let string = "fragment StarshipConnectionFragment on StarshipConnection{ totalCount edges{ cursor node{ cargoCapacity consumables costInCredits crew hyperdriveRating id length manufacturer manufacturers manufacturers maxAtmospheringSpeed MGLT model name passengers starshipClass } } pageInfo{ endCursor hasNextPage hasPreviousPage startCursor } } "
        XCTAssertEqual(fragment.description, string)
    }

    func testPlanetEdgeFragment() {
        let fragment = GQLPlanetEdgeFragment { _ = $0
            .cursor
            .node { _ = $0
                .climates
                .diameter
                .gravity
                .id
                .name
                .orbitalPeriod
                .population
                .rotationPeriod
                .surfaceWater
                .terrains
            }
        }
        let string = "fragment PlanetEdgeFragment on PlanetEdge{ cursor node{ climates diameter gravity id name orbitalPeriod population rotationPeriod surfaceWater terrains } } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testDjangoDebugFragment() {
        let fragment = GQLDjangoDebugFragment { _ = $0
            .sql { _ = $0
                .alias
                .duration
                .encoding
                .isoLevel
                .isSelect
                .isSlow
                .params
                .rawSql
                .sql
                .startTime
                .stopTime
                .transId
                .transStatus
                .vendor
            }
        }
        let string = "fragment DjangoDebugFragment on DjangoDebug{ sql{ alias duration encoding isoLevel isSelect isSlow params rawSql sql startTime stopTime transId transStatus vendor } } "
        XCTAssertEqual(fragment.description, string)
    }

    func testDjangoDebugSQLFragment() {
        let fragment = GQLDjangoDebugSQLFragment { _ = $0
            .alias
            .duration
            .encoding
            .isoLevel
            .isSelect
            .isSlow
            .params
            .rawSql
            .sql
            .startTime
            .stopTime
            .transId
            .transStatus
            .vendor
        }
        let string = "fragment DjangoDebugSQLFragment on DjangoDebugSQL{ alias duration encoding isoLevel isSelect isSlow params rawSql sql startTime stopTime transId transStatus vendor } "
        XCTAssertEqual(fragment.description, string)
    }

    func testCreateHeroPayloadFragment() {
        let fragment = GQLCreateHeroPayloadFragment { _ = $0
            .clientMutationId
            .ok
            .hero { _ = $0
                .id
                .name
            }
        }
        let string = "fragment CreateHeroPayloadFragment on CreateHeroPayload{ clientMutationId ok hero{ id name } } "
        XCTAssertEqual(fragment.description, string)
    }

    func testFilmConnectionFragment() {
        let fragment = GQLFilmConnectionFragment { _ = $0
            .totalCount
            .edges { _ = $0
                .cursor
                .node { _ = $0
                    .director
                    .episodeId
                    .id
                    .openingCrawl
                    .producers
                    .releaseDate
                    .title
                }
            }
            .pageInfo { _ = $0
                .endCursor
                .hasNextPage
                .hasPreviousPage
                .startCursor
            }
        }
        let string = "fragment FilmConnectionFragment on FilmConnection{ totalCount edges{ cursor node{ director episodeId id openingCrawl producers releaseDate title } } pageInfo{ endCursor hasNextPage hasPreviousPage startCursor } } "
        XCTAssertEqual(fragment.description, string)
    }
    
    func testPlanetConnectionFragment() {
        let fragment = GQLPlanetConnectionFragment { _ = $0
            .totalCount
            .edges { _ = $0
                .cursor
                .node { _ = $0
                    .climates
                    .diameter
                    .gravity
                    .id
                    .name
                    .orbitalPeriod
                    .population
                    .rotationPeriod
                    .surfaceWater
                    .terrains
                }
            }
            .pageInfo { _ = $0
                .endCursor
                .hasNextPage
                .hasPreviousPage
                .startCursor
            }
        }
        let string = "fragment PlanetConnectionFragment on PlanetConnection{ totalCount edges{ cursor node{ climates diameter gravity id name orbitalPeriod population rotationPeriod surfaceWater terrains } } pageInfo{ endCursor hasNextPage hasPreviousPage startCursor } } "
        XCTAssertEqual(fragment.description, string)
    }
}
