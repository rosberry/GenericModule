//
//  Copyright © 2021 Rosberry. All rights reserved.
//

// swiftlint:disable explicit_init

open class Module<Presenter: ModulePresenter> where Presenter.View.ViewModel == Presenter.ViewModel {

    public typealias State = Presenter.ViewModel.State
    public typealias Dependencies = Presenter.Dependencies
    public typealias Output = Presenter.Output
    public typealias Input = Presenter.Input
    public typealias ViewController = Presenter.View

    typealias ViewModel = Presenter.ViewModel
    typealias BasePresenter = GenericModule.Presenter<ViewController, Input, Output, Dependencies>

    var presenter: Presenter
    var basePresenter: BasePresenter? {
        presenter as? BasePresenter
    }

    public var viewController: ViewController
    public var input: Input? {
        presenter as? Input
    }

    public var output: Output? {
        get {
            presenter.output
        }
        set {
            basePresenter?.output = newValue
        }
    }

    public init(state: State, dependencies: Dependencies) {
        let viewModel = ViewModel(state: state)
        viewController = ViewController(viewModel: viewModel)
        presenter = Presenter(state: state, dependencies: dependencies)
        basePresenter?.view = viewController
        viewController.output = presenter as? ViewController.Output
    }
}
