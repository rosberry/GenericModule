//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import XCTest
@testable import GenericModule

final class BrokenViewOutputPresenter: Presenter<DummyState, DummyViewController, DummyModuleInput, DummyModuleOutput, Any> {

}

final class NonConformableViewOutputPresenter: ModulePresenter {
    typealias View = DummyViewController
    typealias ViewModel = DummyViewModel
    typealias Input = DummyModuleInput

    let state: DummyState
    weak var view: DummyViewController?
    var output: DummyModuleOutput?

    init(state: DummyState, dependencies: Any) {
        self.state = state
    }

    func makeViewModelDelegate() -> GenericViewModelDelegate<DummyState> {
        .init(state: state)
    }
}

extension NonConformableViewOutputPresenter: DummyViewOutput {
    func userActionTriggered() {
    }

    func moduleActionTriggered() {
    }
}
