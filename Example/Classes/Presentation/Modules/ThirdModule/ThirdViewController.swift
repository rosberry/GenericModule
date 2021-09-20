//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule
import UIKit

protocol ThirdViewOutput: ViewOutput {
    func closeEventTriggered()
}

protocol ThirdViewInput {
    func printText()
}

final class ThirdViewController: TitleTextViewController<ThirdViewInput, ThirdViewOutput> {

    private lazy var gestureRecognizer: UISwipeGestureRecognizer = {
        .init(target: self, action: #selector(swipeActionRecognized))
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        gestureRecognizer.direction = .down
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        label.textColor = .white
        view.addGestureRecognizer(gestureRecognizer)
    }

    // MARK: - Actions

    @objc private func swipeActionRecognized() {
        output.closeEventTriggered()
    }
}

extension ThirdViewController: ThirdViewInput {
    func printText() {
        print(viewModel.text)
    }
}
