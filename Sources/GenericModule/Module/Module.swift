//
//  Copyright © 2021 Rosberry. All rights reserved.
//

open class Module<Presenter: ModulePresenter> where Presenter.View.ViewModel == Presenter.ViewModel {

    public typealias State = Presenter.State
    public typealias Dependencies = Presenter.Dependencies
    public typealias Output = Presenter.Output
    public typealias Input = Presenter.Input
    public typealias ViewController = Presenter.View
    public typealias ViewModelDelegate = Presenter.ViewModel.ViewModelDelegate

    typealias ViewModel = Presenter.ViewModel
    typealias BasePresenter = GenericModule.Presenter<State, ViewController, Input, Output, Dependencies>

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

    public init(state: State, dependencies: Dependencies, output: Output? = nil) {
        let presenter = Presenter(state: state, dependencies: dependencies)
        guard let viewModelDelegate = presenter.makeViewModelDelegate() as? ViewModelDelegate else {
            fatalError("`\(ViewModel.ViewModelDelegate.self)` does not conforms to `\(ViewModelDelegate.self)`")
        }
        // swiftlint:disable:next explicit_init
        let viewModel = ViewModel.init(delegate: viewModelDelegate)
        guard let viewOutput = presenter as? ViewController.Output else {
            fatalError("`\(type(of: presenter))` does not conforms to `\(ViewController.self)` output protocol.")
        }
        viewController = ViewController(viewModel: viewModel, output: viewOutput)
        self.presenter = presenter
        basePresenter?.view = viewController
        self.output = output
    }
}
