//
//  Copyright © 2021 Rosberry. All rights reserved.
//

open class Module<Presenter: ModulePresenter> where Presenter.View.ViewModel == Presenter.ViewModel {

    public typealias State = Presenter.ViewModel.State
    public typealias Dependencies = Presenter.Dependencies
    public typealias Output = Presenter.Output
    public typealias Input = Presenter.Input
    public typealias ViewController = Presenter.View

    typealias ViewModel = Presenter.ViewModel
    typealias BasePresenter = GenericModule.Presenter<ViewController, Input, Output, Dependencies>

    var presenter: Presenter
    var basePresenter: BasePresenter {
        guard let presenter = self.presenter as? BasePresenter else {
            fatalError("`\(type(of: self.presenter))` does not conforms to `\(BasePresenter.self)`.")
        }
        return presenter
    }

    public var viewController: ViewController
    public var input: Input {
        guard let input = presenter as? Input else {
            fatalError("`\(type(of: presenter))` does not conforms to `\(Input.self)`.")
        }
        return input
    }

    public var output: Output? {
        get {
            presenter.output
        }
        set {
            basePresenter.output = newValue
        }
    }

    public init(state: State, dependencies: Dependencies, output: Output? = nil) {
        let viewModel = ViewModel(state: state)
        let presenter = Presenter(state: state, dependencies: dependencies)
        guard let viewOutput = presenter as? ViewController.Output else {
            fatalError("`\(type(of: presenter))` does not conforms to `\(ViewController.self)` output protocol.")
        }
        viewController = ViewController(viewModel: viewModel, output: viewOutput)
        self.presenter = presenter
        basePresenter.view = viewController
        self.output = output
    }
}
