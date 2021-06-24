//
//  Copyright © 2021 Rosberry. All rights reserved.
//

public protocol ModulePresenter {
    associatedtype View: GenericModule.View
    associatedtype ViewModel: GenericModule.ViewModel
    associatedtype Dependencies
    associatedtype Output
    associatedtype Input

    typealias State = ViewModel.State

    init(state: State, dependencies: Dependencies)

    var output: Output? { get }
}
