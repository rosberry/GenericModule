//
//  Copyright © 2021 Rosberry. All rights reserved.
//

public protocol ModulePresenter {
    associatedtype State
    associatedtype View: GenericModule.View
    associatedtype ViewModel: GenericModule.ViewModel
    associatedtype Dependencies
    associatedtype Output
    associatedtype Input
    associatedtype ViewModelDelegate

    init(state: State, dependencies: Dependencies)

    var output: Output? { get }

    func makeViewModelDelegate() -> ViewModelDelegate
}
