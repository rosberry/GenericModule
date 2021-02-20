//
//  Copyright © 2020 Rosberry. All rights reserved.
//

// swiftlint:disable explicit_init

open class Module<State, ModuleViewModel: ViewModel<State>, ModuleViewInput: ViewInput> where ModuleViewModel == ModuleViewInput.ViewModel {

    open class BasePresenter: ModuleInput<State>, ViewOutput {
        open weak var view: ModuleViewInput?

        fileprivate var _output: Any?

        open func viewDidLoad() {
            update(force: true, animated: false)
        }

        open func viewWillAppear() {

        }

        open func viewDidAppear() {

        }

        open func viewWillDisappear() {

        }

        open func viewDidDisappear() {

        }

        open func update(force: Bool = false, animated: Bool) {
            let viewModel = ModuleViewModel.init(state: state)
            view?.update(with: viewModel, force: force, animated: animated)
        }
    }

    open class ModulePresenter<Output, Dependencies>: BasePresenter, HasOutput {
        open var output: Output? {
            get {
                _output as? Output
            }
            set {
                _output = newValue
            }
        }

        open var dependencies: Dependencies

        public init(state: State, dependencies: Dependencies) {
            self.dependencies = dependencies
            super.init(state: state)
        }
    }

    open var viewController: ModuleViewInput
    fileprivate var presenter: BasePresenter?
    open var state: State

    open func input<T>(ofType: T.Type = T.self) -> T? {
        presenter as? T
    }

    open func makeInput() -> BasePresenter {
        .init(state: state)
    }

    public init<Output>(state: State, output: Output? = nil) {
        self.state = state
        let viewModel = ModuleViewModel.init(state: state)
        viewController = ModuleViewInput.init(viewModel: viewModel)
        presenter = makeInput()
        if let viewOutput = presenter as? ModuleViewInput.Output {
            viewController.output = viewOutput
        }
        else {
            fatalError("`\(type(of: presenter))` does not confonforms to ptotocol `\(ModuleViewInput.Output.self)`")
        }
        presenter?.view = viewController
        presenter?._output = output
    }
}

open class FactoryModule<Factory: SectionItemsFactory,
                          ModuleViewModel: FactoryViewModel<Factory>,
                          ModuleViewInput: ViewInput>:
        Module<Factory.State,
        ModuleViewModel,
        ModuleViewInput> where ModuleViewModel == ModuleViewInput.ViewModel,
                               Factory.Output == ModuleViewInput.Output {

    open class FactoryPresenter<Output>: ModulePresenter<Output, Factory.Dependencies>, HasAnyFactory {
        open var factory: Factory?

        var anyFactory: Any? {
            get {
                factory
            }
            set {
                factory = newValue as? Factory
            }
        }

        override public init(state: Factory.State, dependencies: Factory.Dependencies) {
            super.init(state: state, dependencies: dependencies)
            factory = Factory.init(dependencies: dependencies)
            self.dependencies = dependencies
        }

        override open func update(force: Bool = false, animated: Bool) {
            guard let factory = self.factory else {
                return
            }
            let viewModel = ModuleViewModel.init(state: state, factory: factory)
            view?.update(with: viewModel, force: force, animated: animated)
        }
    }

    override public init<Output>(state: Factory.State, output: Output? = nil) {
        super.init(state: state, output: output)
        let presenter = self.presenter as? HasAnyFactory
        var factory = presenter?.anyFactory as? Factory
        factory?.output = self.presenter?.view?.output
    }
}
