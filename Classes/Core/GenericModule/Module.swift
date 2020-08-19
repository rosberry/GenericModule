//
//  Copyright © 2020 Rosberry. All rights reserved.
//

class Module<State, ModuleViewModel: ViewModel<State>, ModuleViewInput: ViewInput> where ModuleViewModel == ModuleViewInput.ViewModel {

    class BasePresenter: ModuleInput<State>, ViewOutput {
        weak var view: ModuleViewInput?

        fileprivate var _output: Any?

        func viewDidLoad() {
            update(force: true, animated: false)
        }

        func viewWillAppear() {

        }

        func viewDidAppear() {

        }
        
        func viewWillDisappear() {

        }

        func viewDidDisappear() {
            
        }

        func update(force: Bool = false, animated: Bool) {
            let viewModel = ModuleViewModel.init(state: state)
            view?.update(with: viewModel, force: force, animated: animated)
        }
    }

    class ModulePresenter<Output, Dependencies>: BasePresenter & HasOutput {
        var output: Output? {
            get {
                _output as? Output
            }
            set {
                _output = newValue
            }
        }

        var dependencies: Dependencies

        init(state: State, dependencies: Dependencies) {
            self.dependencies = dependencies
            super.init(state: state)
        }
    }

    var viewController: ModuleViewInput
    fileprivate var presenter: BasePresenter?
    var state: State

    func input<T: BasePresenter>(ofType: T.Type = T.self) -> T? {
        presenter as? T
    }

    func createInput() -> BasePresenter {
        .init(state: state)
    }

    init<Output>(state: State, output: Output) {
        self.state = state
        let viewModel = ModuleViewModel.init(state: state)
        viewController = ModuleViewInput.init(viewModel: viewModel)
        presenter = createInput()
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

class FactoryModule<Factory: SectionItemsFactory,
                    ModuleViewModel: FactoryViewModel<Factory>,
                    ModuleViewInput: ViewInput>:
                        Module<Factory.State,
                              ModuleViewModel,
                              ModuleViewInput> where ModuleViewModel == ModuleViewInput.ViewModel,
                                                     Factory.Output == ModuleViewInput.Output {

    class FactoryPresenter<Output>: ModulePresenter<Output, Factory.Dependencies> {
        var factory: Factory?

        override init(state: Factory.State, dependencies: Factory.Dependencies) {
            super.init(state: state, dependencies: dependencies)
            factory = Factory.init(dependencies: dependencies)
            factory?.output = view?.output
            self.dependencies = dependencies
        }

        override func update(force: Bool = false, animated: Bool) {
            guard let factory = self.factory else {
                return
            }
            let viewModel = ModuleViewModel.init(state: state, factory: factory)
            view?.update(with: viewModel, force: force, animated: animated)
        }
    }

    override init<Output>(state: Factory.State, output: Output) {
        super.init(state: state, output: output)
    }
}
