import XCTest
@testable import GenericModule

final class GenericModuleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GenericModule().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
