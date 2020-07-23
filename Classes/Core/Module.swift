//
//  Module.swift
//  Coordinators
//
//  Created by Nick Tyunin on 14.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

class GenericViewModel<State> {
    required init(state: State) {
    }
}

protocol SectionItemsFactory {
    associatedtype SectionItem
    associatedtype State
    associatedtype Dependencies
    init(dependencies: Dependencies)
    func createSectionItems(state: State) -> [SectionItem]
}

class FactoryViewModel<Factory: SectionItemsFactory>: GenericViewModel<Factory.State> {
    var listSectionItems: [Factory.SectionItem]
    required convenience init(state: Factory.State, factory: Factory) {
        self.init(state: state)
        listSectionItems = factory.createSectionItems(state: state)
    }

    required init(state: Factory.State) {
        listSectionItems = []
        super.init(state: state)
    }
}

protocol HasOutput: class {
    associatedtype Output
    var output: Output? { get set }
}

protocol HasDependencies {
    associatedtype Dependencies
    var dependencies: Dependencies { get }
}

protocol HasFactory {
    associatedtype Factory
    var factory: Factory { get }
}

protocol ViewInput: HasOutput {

    associatedtype VM

    var viewModel: VM { get set}

    init(viewModel: VM)
    func update(with viewModel: VM, force: Bool, animated: Bool)
}

class ModuleInput<S> {
    var state: S
    init(state: S) {
        self.state = state
    }
}

protocol ViewOutput {
    func viewDidLoad()
}

class Module<S, VM: GenericViewModel<S>, V: ViewInput> {

    class BasePresenter: ModuleInput<S>, ViewOutput {
        weak var view: V?

        func viewDidLoad() {
            update(force: true, animated: false)
        }

        func update(force: Bool = false, animated: Bool) {
            let viewModel = VM.init(state: state)
            view?.update(with: viewModel as! V.VM, force: force, animated: animated)
        }

        fileprivate var _output: Any?
        fileprivate var _dependencies: Any?
        fileprivate var _factory: Any?
    }

    class ModulePresenter<O, D>: BasePresenter & HasOutput & HasDependencies {
        var output: O? {
            get {
                _output as? O
            }
            set {
                _output = newValue
            }
        }

        var dependencies: D {
            get {
                _dependencies as! D
            }
        }

        init(state: S, dependencies: D) {
            super.init(state: state)
            _dependencies = dependencies
        }
    }

    var viewController: V
    fileprivate var presenter: BasePresenter?
    var state: S

    func input<T: BasePresenter>() -> T? {
        presenter as? T
    }

    func createInput() -> BasePresenter {
        preconditionFailure("This method must be overridden") 
    }

    init<O>(state: S, output: O) {
        self.state = state
        let viewModel = VM.init(state: state)
        viewController = V.init(viewModel: viewModel as! V.VM)
        presenter = createInput()
        let viewOutput = presenter as! V.Output
        viewController.output = viewOutput
        presenter?.view = viewController
        presenter?._output = output
    }
}

class FactoryModule<F: SectionItemsFactory, VM: FactoryViewModel<F>, V: ViewInput>: Module<F.State, VM, V> {

    class FactoryPresenter<O>: ModulePresenter<O, F.Dependencies> {
        var factory: F? {
            get {
                _factory as? F
            }
            set {
                _factory = newValue
            }
        }

        override init(state: F.State, dependencies: F.Dependencies) {
            super.init(state: state, dependencies: dependencies)
            factory = F.init(dependencies: dependencies)
            _dependencies = dependencies
        }

        override func update(force: Bool = false, animated: Bool) {
            let viewModel = VM.init(state: state, factory: factory!)
            view?.update(with: viewModel as! V.VM, force: force, animated: animated)
        }
    }

    override init<O>(state: F.State, output: O) {
        super.init(state: state, output: output)
    }
}
