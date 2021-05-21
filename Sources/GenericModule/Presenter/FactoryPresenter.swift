//
//  Copyright © 2021 Rosberry. All rights reserved.
//

open class FactoryPresenter<View: GenericModule.View,
                            Factory: SectionItemsFactory,
                            Input,
                            Output,
                            Dependencies>: Presenter<View, Input, Output, Dependencies>,
                                           FactoryModulePresenter where
                                           Dependencies == Factory.Dependencies,
                                           View.ViewModel: FactoryViewModel<Factory> {

    open var factory: Factory

    required public init(state: State, dependencies: Dependencies) {
        // swiftlint:disable:next explicit_init
        factory = Factory.init(dependencies: dependencies)
        super.init(state: state, dependencies: dependencies)
    }

    override open func update(force: Bool = false, animated: Bool) {
        // swiftlint:disable:next explicit_init
        let viewModel = ViewModel.init(state: state, factory: factory)
        view?.update(with: viewModel, force: force, animated: animated)
    }
}
