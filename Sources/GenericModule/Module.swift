//
//  Copyright © 2020 Rosberry. All rights reserved.
//

// swiftlint:disable explicit_init

public protocol View: class {
    associatedtype Output
    associatedtype ViewModel: GenericModule.ViewModel
    associatedtype ViewInput

    var output: Output? { get set }

    init(viewModel: ViewModel)
    func update(with viewModel: ViewModel, force: Bool, animated: Bool)
}


public protocol ModulePresenter {
    associatedtype View: GenericModule.View
    associatedtype ViewModel: GenericModule.ViewModel
    associatedtype Dependencies
    associatedtype Output
    associatedtype Input

    init(state: ViewModel.State, dependencies: Dependencies)

    var output: Output? { get }
}

open class BasePresenter<View: GenericModule.View,
                         Input,
                         Output,
                         Dependencies>: ModulePresenter, ViewOutput {

    public typealias ViewModel = View.ViewModel
    public typealias State = ViewModel.State

    public var state: State
    public var output: Output?

    weak var view: View?
    public var viewInput: View.ViewInput? {
        view as? View.ViewInput
    }


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

    open var dependencies: Dependencies

    public required init(state: ViewModel.State, dependencies: Dependencies) {
        self.dependencies = dependencies
        self.state = state
    }

    open func update(force: Bool = false, animated: Bool) {
        let viewModel = ViewModel.init(state: state)
        view?.update(with: viewModel, force: force, animated: animated)
    }
}

open class Module<Presenter: ModulePresenter> where Presenter.View.ViewModel == Presenter.ViewModel {

    public typealias State = Presenter.ViewModel.State
    public typealias Dependencies = Presenter.Dependencies
    public typealias Output = Presenter.Output
    public typealias Input = Presenter.Input
    public typealias ViewController = Presenter.View

    typealias ViewModel = Presenter.ViewModel
    typealias BasePresenter = GenericModule.BasePresenter<ViewController, Input, Output, Dependencies>

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

//open class FactoryModule<Factory: SectionItemsFactory,
//                          ModuleViewModel: FactoryViewModel<Factory>,
//                          ModuleViewInput: ViewInput>:
//        Module<Factory.State,
//        ModuleViewModel,
//        ModuleViewInput> where ModuleViewModel == ModuleViewInput.ViewModel,
//                               Factory.Output == ModuleViewInput.Output {
//
//    open class FactoryPresenter<Output>: ModulePresenter<Output, Factory.Dependencies>, HasAnyFactory {
//        open var factory: Factory?
//
//        var anyFactory: Any? {
//            get {
//                factory
//            }
//            set {
//                factory = newValue as? Factory
//            }
//        }
//
//        override public init(state: Factory.State, dependencies: Factory.Dependencies) {
//            super.init(state: state, dependencies: dependencies)
//            factory = Factory.init(dependencies: dependencies)
//            self.dependencies = dependencies
//        }
//
//        override open func update(force: Bool = false, animated: Bool) {
//            guard let factory = self.factory else {
//                return
//            }
//            let viewModel = ModuleViewModel.init(state: state, factory: factory)
//            view?.update(with: viewModel, force: force, animated: animated)
//        }
//    }
//
//    override public init<Output>(state: Factory.State, output: Output? = nil) {
//        super.init(state: state, output: output)
//        let presenter = self.presenter as? HasAnyFactory
//        var factory = presenter?.anyFactory as? Factory
//        factory?.output = self.presenter?.view?.output
//    }
//}
