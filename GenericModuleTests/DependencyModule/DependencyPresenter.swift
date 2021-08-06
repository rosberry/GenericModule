//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

final class DependencyPresenter: Presenter<DummyState, DummyViewController, DummyModuleInput, DummyModuleOutput, DependencyProtocol> {

}

extension DependencyPresenter: DummyViewOutput {
    func userActionTriggered() {

    }

    func moduleActionTriggered() {

    }
}

extension DependencyPresenter: DummyModuleInput {
    func handleIncomingAction() {

    }
}
