//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import Foundation
import XCTest
@testable import GenericModule

extension XCTestCase {
    func expectFatalError(expectedMessage: String, testcase: @escaping () -> Void) {
        let expectation = self.expectation(description: "expectingFatalError")
        var assertionMessage: String? = nil

        FatalErrorUtil.replaceFatalError { message, _, _ in
            assertionMessage = message
            expectation.fulfill()
        }

        DispatchQueue.global(qos: .userInteractive).async(execute: testcase)

        waitForExpectations(timeout: 5) { _ in
            XCTAssertEqual(assertionMessage, expectedMessage)
            FatalErrorUtil.restoreFatalError()
        }
    }
}
