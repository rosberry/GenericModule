//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import UIKit

open class ViewController<ViewModel: GenericModule.ViewModel, ViewInput, Output>: UIViewController, View {
    public var output: Output
    public var viewModel: ViewModel

    private var genericModuleViewOutput: ViewOutput? {
        output as? ViewOutput
    }

    // MARK: - Lifecycle

    public required init(viewModel: ViewModel, output: Output) {
        self.viewModel = viewModel
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        genericModuleViewOutput?.viewDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        genericModuleViewOutput?.viewWillAppear()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        genericModuleViewOutput?.viewDidAppear()
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        genericModuleViewOutput?.viewWillDisappear()
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        genericModuleViewOutput?.viewDidDisappear()
    }

    open func update(with viewModel: ViewModel, force: Bool, animated: Bool) {
        let viewUpdate = Update(newModel: viewModel, oldModel: self.viewModel, force: force)
        self.viewModel = viewModel
        update(with: viewUpdate, animated: animated)
    }

    open func update(with viewUpdate: Update<ViewModel>, animated: Bool) {

    }
}
