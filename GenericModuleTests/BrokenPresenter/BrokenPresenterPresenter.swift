//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

final class BrokenPresenterPresenter: ModulePresenter {
    typealias View = DummyViewController
    typealias ViewModel = DummyViewModel
    typealias Dependencies = Any
    typealias Output = DummyModuleOutput
    typealias Input = DummyModuleInput

    var output: Output?

    init(state: State, dependencies: Any) {

    }
}

extension BrokenPresenterPresenter: DummyViewOutput {
    func userActionTriggered() {

    }

    func moduleActionTriggered() {

    }
}

extension BrokenPresenterPresenter: ViewOutput {
    func viewDidLoad() {

    }

    func viewWillAppear() {

    }

    func viewDidAppear() {

    }

    func viewWillDisappear() {

    }

    func viewDidDisappear() {

    }
}
