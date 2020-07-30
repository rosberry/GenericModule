//
//  Module.swift
//  Coordinators
//
//  Created by Nick Tyunin on 14.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

class ViewModel<State> {
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

class FactoryViewModel<Factory: SectionItemsFactory>: ViewModel<Factory.State> {
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

    associatedtype ViewModel

    var viewModel: ViewModel { get set}

    init(viewModel: ViewModel)
    func update(with viewModel: ViewModel, force: Bool, animated: Bool)
}

class ModuleInput<State> {
    var state: State
    init(state: State) {
        self.state = state
    }
}

protocol ViewOutput {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

class Module<State, ModuleViewModel: ViewModel<State>, ModuleViewInput: ViewInput> where ModuleViewModel == ModuleViewInput.ViewModel {

    class BasePresenter: ModuleInput<State>, ViewOutput {
        weak var view: ModuleViewInput?

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

        fileprivate var _output: Any?
        fileprivate var _dependencies: Any?
        fileprivate var _factory: Any?
    }

    class ModulePresenter<Output, Dependencies>: BasePresenter & HasOutput & HasDependencies {
        var output: Output? {
            get {
                _output as? Output
            }
            set {
                _output = newValue
            }
        }

        var dependencies: Dependencies {
            guard let dependencies = _dependencies as? Dependencies else {
                fatalError("`\(type(of: _dependencies))` does not conform to ptotocol \(Dependencies.self)")
            }
            return dependencies
        }

        init(state: State, dependencies: Dependencies) {
            super.init(state: state)
            _dependencies = dependencies
        }
    }

    var viewController: ModuleViewInput
    fileprivate var presenter: BasePresenter?
    var state: State

    func input<T: BasePresenter>() -> T? {
        presenter as? T
    }

    func createInput() -> BasePresenter {
        preconditionFailure("This method must be overridden") 
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

class FactoryModule<Factory: SectionItemsFactory, ModuleViewModel: FactoryViewModel<Factory>, ModuleViewInput: ViewInput>: Module<Factory.State, ModuleViewModel, ModuleViewInput> where ModuleViewModel == ModuleViewInput.ViewModel {

    class FactoryPresenter<Output>: ModulePresenter<Output, Factory.Dependencies> {
        var factory: Factory? {
            get {
                _factory as? Factory
            }
            set {
                _factory = newValue
            }
        }

        override init(state: Factory.State, dependencies: Factory.Dependencies) {
            super.init(state: state, dependencies: dependencies)
            factory = Factory.init(dependencies: dependencies)
            _dependencies = dependencies
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
