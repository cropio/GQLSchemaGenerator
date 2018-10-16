import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    var tests = []

    let schema = [
        testCase(SchemaArgumentTests.allTests),
        testCase(SchemaEnumValueTests.allTests),
        testCase(SchemaFieldTests.allTests),
        testCase(SchemaInputFieldTests.allTests),
        testCase(SchemaKindTests.allTests),
        testCase(SchemaObjectTests.allTests),
        testCase(SchemaObjectTypeTests.allTests),
    ]
    
    tests += schema
    
    
    return tests
}
#endif
