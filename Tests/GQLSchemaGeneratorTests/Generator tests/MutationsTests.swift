//
//  MutationsTests.swift
//  GQLSchemaGeneratorTests
//
//  Created by Evgeny Kalashnikov on 10/18/18.
//

import XCTest

class MutationsTests: XCTestCase {
//
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testCreateHero() {
//        let query = GQLMutation.createHero { _ = $0
//            .clientMutationId
//            .hero { _ = $0
//                .id
//                .name
//            }
//        }
//        let string = "createHero{ clientMutationId hero{ id name } } "
//
//        XCTAssertEqual(query.body, string)
//        XCTAssertEqual(query.type, .mutation)
//        XCTAssertNil(query.fragmentQuery)
//    }
//
//    func testCreateHeroFragment() {
//        let fragment = GQLCreateHeroPayloadFragment { _ = $0
//            .clientMutationId
//            .hero { _ = $0
//                .id
//                .name
//            }
//        }
//        let query = GQLMutation.createHero(fragment: fragment)
//        let string = "createHero{ ...CreateHeroPayloadFragment } "
//
//        XCTAssertEqual(query.body, string)
//        XCTAssertEqual(query.fragmentQuery?.body, fragment.description)
//        XCTAssertEqual(query.type, .mutation)
//    }
}
