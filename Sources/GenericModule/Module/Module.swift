//
//  Copyright © 2021 Rosberry. All rights reserved.
//

open class Module<Presenter: ModulePresenter> where Presenter.View.ViewModel == Presenter.ViewModel {

    public typealias State = Presenter.State
    public typealias Dependencies = Presenter.Dependencies
    public typealias Output = Presenter.Output
    public typealias Input = Presenter.Input
    public typealias ViewController = Presenter.View
    public typealias ViewModelBuilder = Presenter.ViewModelBuilder

    typealias ViewModel = Presenter.ViewModel
    typealias BasePresenter = GenericModule.Presenter<ViewController, ViewModelBuilder, Input, Output, Dependencies>

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
        let viewModel = ViewModel.init(builder: presenter.makeViewModelBuilder())
        guard let viewOutput = presenter as? ViewController.Output else {
            fatalError("`\(type(of: presenter))` does not conforms to `\(ViewController.self)` output protocol.")
        }
        viewController = ViewController(viewModel: viewModel, output: viewOutput)
        self.presenter = presenter
        basePresenter?.view = viewController
        self.output = output
    }
}
