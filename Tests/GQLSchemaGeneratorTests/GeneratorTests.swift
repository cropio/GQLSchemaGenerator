//
//  GeneratorTests.swift
//  GQLSchemaGeneratorTests
//
//  Created by Evgeny Kalashnikov on 10/18/18.
//

import XCTest
@testable import GQLSchemaGeneratorCore

class GeneratorTests: XCTestCase {

    // As a string

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGeneration() {
        
        let filePath: String = #file
        
        var bundle = URL(fileURLWithPath: filePath)
        bundle.deleteLastPathComponent()
        
        let root = bundle.appendingPathComponent("Utilities").path
        let destination = bundle.appendingPathComponent("Generated").path
        Executable().execute(rootPath: root, destinationPath: destination)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
