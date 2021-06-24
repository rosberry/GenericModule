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

    public required init(state: ViewModel.State, dependencies: Dependencies) {
        self.dependencies = dependencies
        self.state = state
    }

    open func update(force: Bool = false, animated: Bool) {
        // swiftlint:disable:next explicit_init
        let viewModel = ViewModel.init(state: state)
        view?.update(with: viewModel, force: force, animated: animated)
    }
}
