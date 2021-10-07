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

final class DummyViewController: ViewController<DummyViewModel, DummyViewInput, DummyViewOutput> {

    // MARK: - Subviews

    private(set) lazy var label: UILabel = .init()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        label.frame = view.bounds
    }

    override func update(with viewUpdate: Update<DummyViewModel>, animated: Bool) {
        super.update(with: viewUpdate, animated: animated)
        viewUpdate(\.text) { text in
            label.text = text
        }
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
