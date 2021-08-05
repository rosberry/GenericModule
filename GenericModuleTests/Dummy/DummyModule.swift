//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import XCTest
@testable import GenericModule

protocol DummyModuleInput {
    func handleIncomingAction()
}

protocol DummyModuleOutput {
    func dummyModulePerformsAction(_ module: DummyModuleInput)
}

final class DummyModule: Module<DummyPresenter> {

}
