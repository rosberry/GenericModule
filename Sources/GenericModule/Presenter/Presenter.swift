//
//  Copyright © 2021 Rosberry. All rights reserved.
//

open class Presenter<State,
                     View: GenericModule.View,
                     Input,
                     Output,
                     Dependencies>: ModulePresenter, ViewOutput {

    public typealias ViewModel = View.ViewModel
    public typealias ViewModelDelegate = ViewModel.ViewModelDelegate

    public var state: State
    public var output: Output?

    public let dependencies: Dependencies

    weak var view: View?
    public var viewInput: View.ViewInput {
        guard let view = self.view else {
            fatalError("Presenter view input is nil. " +
                       "Please make sure sure that you don't have strong references " +
                       "to \(type(of: self)) or \(Input.self).")
        }
        guard let viewInput = view as? View.ViewInput else {
            fatalError("`\(View.self)` does not conforms to `\(View.self)` input.")
        }
        return viewInput
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

    open func makeViewModelDelegate() -> ViewModelDelegate {
        if let delegate = self as? ViewModelDelegate {
            return delegate
        }
        else if let delegate = GenericViewModelDelegate<State>(state: state) as? ViewModelDelegate {
            return delegate
        }
        fatalError("Please make sure that `makeViewModelDelegate()` method overriden")
    }

    public required init(state: State, dependencies: Dependencies) {
        self.dependencies = dependencies
        self.state = state
    }

    open func update(force: Bool = false, animated: Bool) {
        // swiftlint:disable:next explicit_init
        let viewModel = ViewModel.init(delegate: makeViewModelDelegate())
        view?.update(with: viewModel, force: force, animated: animated)
    }
}

open class FactoryPresenter<State,
                            Factory: SectionItemsFactory,
                            View: GenericModule.View,
                            Input,
                            Output,
                            Dependencies>: Presenter<State,
                                                     View,
                                                     Input,
                                                     Output,
                                                     Dependencies>
                            where Factory.Dependencies == Dependencies,
                                  Factory.ViewModelDelegate == View.ViewModel.ViewModelDelegate {
    public let factory: Factory

    public required init(state: State, dependencies: Dependencies) {
        factory = .init(dependencies: dependencies)
        super.init(state: state, dependencies: dependencies)
        factory.output = self as? Factory.Output
    }

    public func makeSectionItems() -> [Factory.SectionItem] {
        let delegate = makeViewModelDelegate()
        return factory.makeSectionItems(delegate: delegate)
    }
}
