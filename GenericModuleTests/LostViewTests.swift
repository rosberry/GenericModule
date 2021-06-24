//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import XCTest
@testable import GenericModule

final class LostViewTests: XCTestCase {

    func testLostView() {
        let state = DummyState(text: "test")
        guard let presenter = DummyModule(state: state, dependencies: []).input as? DummyPresenter else {
            XCTAssert(false)
            return
        }
        let expectation = self.expectation(for: NSPredicate(block: { presenter, _ in
            guard let presenter = presenter as? DummyPresenter else {
                return false
            }
            return presenter.view == nil
        }), evaluatedWith: presenter, handler: nil)
        wait(for: [expectation], timeout: 60)
        let expectedMessage = "Presenter view input is nil. " +
            "Please make sure sure that you don't have strong references " +
            "to \(DummyPresenter.self) or \( DummyModule.BasePresenter.Input.self)."
        expectFatalError(expectedMessage: expectedMessage) {
            let _ = presenter.viewInput
        }
    }
}
