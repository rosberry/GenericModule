//
//  Copyright © 2021 Rosberry. All rights reserved.
//

open class Presenter<View: GenericModule.View,
                     ViewModelBuilder,
                     Input,
                     Output,
                     Dependencies>: ModulePresenter, ViewOutput where ViewModelBuilder == View.ViewModel.ViewModelBuilder  {

    public typealias ViewModel = View.ViewModel
    public typealias ViewModelBuilder = ViewModel.ViewModelBuilder
    public typealias State = ViewModelBuilder.State

    public var state: State
    public var output: Output?

    let dependencies: Dependencies

    weak var view: View?
    public var viewInput: View.ViewInput {
        guard let view = self.view else {
            fatalError("Presenter view input is nil. " +
                       "Please make sure sure that you don't have strong references " +
                       "to \(type(of: self)) or \(Input.self).")
        }
        guard let viewInput = view as? View.ViewInput else {
            fatalError("`\(View.self)` does not conforms to \(View.self) input.")
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

    public func makeViewModelBuilder() -> ViewModelBuilder {
        fatalError("`makeViewModelBuilder()` should be owerriden")
    }

    public required init(state: State, dependencies: Dependencies) {
        self.dependencies = dependencies
        self.state = state
    }

    open func update(force: Bool = false, animated: Bool) {
        let viewModel = ViewModel.init(builder: makeViewModelBuilder())
        view?.update(with: viewModel, force: force, animated: animated)
    }
}

open class DefaultPresenter<State, View: GenericModule.View, Input, Output, Dependencies>: Presenter<View, GenericViewModelBuilder<State>, Input, Output, Dependencies> where View.ViewModel.ViewModelBuilder == GenericViewModelBuilder<State> {

    public override func makeViewModelBuilder() -> GenericViewModelBuilder<State> {
        .init(state: state)
    }
}

open class FactoryPresenter<Factory: SectionItemsFactory, View: GenericModule.View, Input, Output, Dependencies>: Presenter<View, FactoryViewModelBuilder<Factory>, Input, Output, Dependencies> where View.ViewModel.ViewModelBuilder == FactoryViewModelBuilder<Factory>, Factory.Dependencies == Dependencies {

    open var factory: Factory

    public override func makeViewModelBuilder() -> FactoryViewModelBuilder<Factory> {
        .init(state: state, factory: factory)
    }

    required public init(state: State, dependencies: Dependencies) {
        // swiftlint:disable:next explicit_init
        factory = Factory.init(dependencies: dependencies)
        super.init(state: state, dependencies: dependencies)
    }
}
