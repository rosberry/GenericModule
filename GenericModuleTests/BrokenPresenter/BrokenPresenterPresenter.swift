//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

final class BrokenPresenterPresenter: ModulePresenter {
    typealias State = DummyState
    typealias ViewModelDelegate = GenericViewModelDelegate<State>
    typealias View = DummyViewController
    typealias ViewModel = DummyViewModel
    typealias Dependencies = Any
    typealias Output = DummyModuleOutput
    typealias Input = DummyModuleInput

    var output: Output?

    let state: State

    init(state: State, dependencies: Any) {
        self.state = state
    }

    func makeViewModelDelegate() -> GenericViewModelDelegate<State> {
        .init(state: state)
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
