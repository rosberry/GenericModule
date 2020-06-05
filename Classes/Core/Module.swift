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

class GenericPresenter<S> {
    var state: S
    init(state: S) {
        self.state = state
    }
}

class Module<S, VM: GenericViewModel<S>, V: ViewInput> {

    class BasePresenter: GenericPresenter<S>  {
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

    class DependentPresenter<O, D>: BasePresenter & HasOutput & HasDependencies {
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

    class FactoryPresenter<O, D, F>: DependentPresenter<O, D> & HasFactory {

        var factory: F {
            _factory as! F
        }

        init(state: S, factory: F, dependencies: D) {
            super.init(state: state, dependencies: dependencies)
            _factory = factory
        }
    }

    var viewController: V
    private var presenter: BasePresenter?
    var state: S

    func input<T: BasePresenter>() -> T? {
        presenter as? T
    }

    func createInput() -> BasePresenter {
        fatalError("`inputClass<T>()` required to be implemented")
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
