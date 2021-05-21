//
//  Copyright © 2021 Rosberry. All rights reserved.
//

open class Presenter<View: GenericModule.View,
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
