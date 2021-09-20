//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

final class BrokenModuleInputPresenter: Presenter<DummyState, DummyViewController, DummyModuleInput, DummyModuleOutput, Any> {

}

extension BrokenModuleInputPresenter: DummyViewOutput {
    func userActionTriggered() {

    }

    func moduleActionTriggered() {

    }
}
