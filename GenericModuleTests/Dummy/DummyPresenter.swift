//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

final class DummyPresenter: Presenter<DummyViewController, DummyModuleInput, DummyModuleOutput, Any> {

    override func viewDidLoad() {
        super.viewDidLoad()
        state.didLoad = true
    }

    override func viewWillAppear() {
        super.viewWillAppear()
        state.willAppear = true
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        state.didAppear = true
    }

    override func viewWillDisappear() {
        super.viewWillDisappear()
        state.willDisappear = true
    }

    override func viewDidDisappear() {
        super.viewDidDisappear()
        state.didDisappear = true
    }
}

extension DummyPresenter: DummyModuleInput {
    func handleIncomingAction() {
        state.incommingActionTriggered = true
    }
}

extension DummyPresenter: DummyViewOutput {
    func userActionTriggered() {
        state.userActionTriggered = true
    }

    func moduleActionTriggered() {
        output?.dummyModulePerformsAction(self)
    }
}
