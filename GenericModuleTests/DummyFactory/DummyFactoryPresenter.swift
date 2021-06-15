//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

class DummyFactoryPresenter: FactoryPresenter<DummyFactoryViewController,
                                              DummyListItemsFactory,
                                              DummyFactoryModuleInput,
                                              DummyFactoryModuleOutput,
                                              Any> {
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

extension DummyFactoryPresenter: DummyFactoryModuleInput {
    func handleIncomingAction() {
        state.incommingActionTriggered = true
    }
}

extension DummyFactoryPresenter: DummyFactoryViewOutput {
    func userActionTriggered() {
        state.userActionTriggered = true
    }

    func moduleActionTriggered() {
        output?.dummyFactoryModulePerformsAction(self)
    }
}
