//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import UIKit
@testable import GenericModule

protocol DummyViewOutput {
    func userActionTriggered()
    func moduleActionTriggered()
}

protocol DummyViewInput {
    func performUserAction()
    func performModuleAction()
}

final class DummyViewController: UIViewController {

    typealias Output = DummyViewOutput & ViewOutput
    typealias ViewInput = DummyViewInput
    var output: Output
    var viewModel: DummyViewModel

    // MARK: - Subviews

    private(set) lazy var label: UILabel = .init()

    // MARK: - Lifecycle

    init(viewModel: DummyViewModel, output: Output) {
        self.viewModel = viewModel
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        Swift.fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        output.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output.viewWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        output.viewDidDisappear()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        label.frame = view.bounds
    }
}

extension DummyViewController: View {

    func update(with viewModel: DummyViewModel, force: Bool, animated: Bool) {
        self.viewModel = viewModel
        label.text = viewModel.text
    }
}

extension DummyViewController: DummyViewInput {
    func performUserAction() {
        output.userActionTriggered()
    }

    func performModuleAction() {
        output.moduleActionTriggered()
    }
}
