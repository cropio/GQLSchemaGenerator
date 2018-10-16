//
//  Swift.swift
//  GQLSchemaGeneratorTests
//
//  Created by Evgeny Kalashnikov on 10/16/18.
//

import XCTest
@testable import GQLSchemaGeneratorCore

class SwiftImportTests: XCTestCase {

    func testInit() {
        let imported = Swift.Import(module: "TestModule")
        XCTAssertEqual(imported.stringRepresentation, "import TestModule\n")
    }
}
