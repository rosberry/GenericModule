//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import UIKit
@testable import GenericModule

final class BrokenViewInputController: UIViewController {
    typealias Output = DummyViewOutput & ViewOutput
    typealias ViewInput = DummyViewInput
    var output: Output
    var viewModel: DummyViewModel

    // MARK: - Lifecycle

    init(viewModel: DummyViewModel, output: Output) {
        self.viewModel = viewModel
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        Swift.fatalError("init(coder:) has not been implemented")
    }
}

extension BrokenViewInputController: View {

    func update(with viewModel: DummyViewModel, force: Bool, animated: Bool) {
        self.viewModel = viewModel
    }
}
