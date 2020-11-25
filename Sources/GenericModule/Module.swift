//
//  Copyright © 2020 Rosberry. All rights reserved.
//

// swiftlint:disable explicit_init

public class Module<State, ModuleViewModel: ViewModel<State>, ModuleViewInput: ViewInput> where ModuleViewModel == ModuleViewInput.ViewModel {

    public class BasePresenter: ModuleInput<State>, ViewOutput {
        public weak var view: ModuleViewInput?

        fileprivate var _output: Any?

        public func viewDidLoad() {
            update(force: true, animated: false)
        }

        public func viewWillAppear() {

        }

        public func viewDidAppear() {

        }

        public func viewWillDisappear() {

        }

        public func viewDidDisappear() {

        }

        public func update(force: Bool = false, animated: Bool) {
            let viewModel = ModuleViewModel.init(state: state)
            view?.update(with: viewModel, force: force, animated: animated)
        }
    }

    public class ModulePresenter<Output, Dependencies>: BasePresenter, HasOutput {
        public var output: Output? {
            get {
                _output as? Output
            }
            set {
                _output = newValue
            }
        }

        public var dependencies: Dependencies

        public init(state: State, dependencies: Dependencies) {
            self.dependencies = dependencies
            super.init(state: state)
        }
    }

    public var viewController: ModuleViewInput
    fileprivate var presenter: BasePresenter?
    public var state: State

    public func input<T>(ofType: T.Type = T.self) -> T? {
        presenter as? T
    }

    public func makeInput() -> BasePresenter {
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

public class FactoryModule<Factory: SectionItemsFactory,
                          ModuleViewModel: FactoryViewModel<Factory>,
                          ModuleViewInput: ViewInput>:
        Module<Factory.State,
        ModuleViewModel,
        ModuleViewInput> where ModuleViewModel == ModuleViewInput.ViewModel,
Factory.Output == ModuleViewInput.Output {

    public class FactoryPresenter<Output>: ModulePresenter<Output, Factory.Dependencies> {
        public var factory: Factory?

        override public init(state: Factory.State, dependencies: Factory.Dependencies) {
            super.init(state: state, dependencies: dependencies)
            factory = Factory.init(dependencies: dependencies)
            factory?.output = view?.output
            self.dependencies = dependencies
        }

        override public func update(force: Bool = false, animated: Bool) {
            guard let factory = self.factory else {
                return
            }
            let viewModel = ModuleViewModel.init(state: state, factory: factory)
            view?.update(with: viewModel, force: force, animated: animated)
        }
    }

    override public init<Output>(state: Factory.State, output: Output? = nil) {
        super.init(state: state, output: output)
    }
}
