//
//  __Schema.KindTests.swift
//  Gryphin
//
//  Created by Dima Bart on 2017-01-31.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import XCTest
@testable import GQLSchemaGeneratorCore

class SchemaKindTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Init -
    //
    func testInitSingle() {
        XCTAssertEqual(__Schema.__Kind(string: "SCALAR"),       .scalar)
        XCTAssertEqual(__Schema.__Kind(string: "OBJECT"),       .object)
        XCTAssertEqual(__Schema.__Kind(string: "INTERFACE"),    .interface)
        XCTAssertEqual(__Schema.__Kind(string: "UNION"),        .union)
        XCTAssertEqual(__Schema.__Kind(string: "ENUM"),         .enum)
        XCTAssertEqual(__Schema.__Kind(string: "INPUT_OBJECT"), .inputObject)
        XCTAssertEqual(__Schema.__Kind(string: "LIST"),         .list)
        XCTAssertEqual(__Schema.__Kind(string: "NON_NULL"),     .nonNull)
    }
    
    func testInitCollection() {
        let strings = [
            "SCALAR",
            "OBJECT",
            "invalidValue",
            "INTERFACE",
        ]
        
        let kinds = __Schema.__Kind.collectionWith(strings: strings)
        
        XCTAssertEqual(kinds.count, 3)
        
        XCTAssertEqual(kinds[0], .scalar)
        XCTAssertEqual(kinds[1], .object)
        XCTAssertEqual(kinds[2], .interface)
    }
    
    static var allTests = [
        ("testInitSingle", testInitSingle),
        ("testInitCollection", testInitCollection),
    ]
}
