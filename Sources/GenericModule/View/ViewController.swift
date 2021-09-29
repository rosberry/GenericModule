//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import UIKit

open class ViewController<ViewModel: GenericModule.ViewModel, ViewInput, Output>: UIViewController, View {
    public var output: Output
    public var viewModel: ViewModel
    private var viewOutput: ViewOutput

    // MARK: - Lifecycle

    public required init(viewModel: ViewModel, output: Output) {
        self.viewModel = viewModel
        self.output = output
        guard let viewOutput = output as? ViewOutput else {
            fatalError("`\(type(of: output))` does not conforms to `ViewOutput` protocol")
        }
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        viewOutput.viewDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewOutput.viewWillAppear()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewOutput.viewDidAppear()
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewOutput.viewWillDisappear()
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewOutput.viewDidDisappear()
    }

    open func update(with viewModel: ViewModel, force: Bool, animated: Bool) {
        let viewUpdate = Update(newModel: viewModel, oldModel: self.viewModel, force: force)
        self.viewModel = viewModel
        update(with: viewUpdate, animated: animated)
    }

    open func update(with viewUpdate: Update<ViewModel>, animated: Bool) {

    }
}
