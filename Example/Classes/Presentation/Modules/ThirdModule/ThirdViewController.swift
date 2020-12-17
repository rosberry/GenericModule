//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule
import UIKit

protocol ThirdViewOutput: ViewOutput {
    func closeEventTriggered()
}

final class ThirdViewController: TitleTextViewController {

    var thirdViewOutput: ThirdViewOutput? {
        output as? ThirdViewOutput
    }

    private lazy var gestureRecognizer: UISwipeGestureRecognizer = .init(target: self, action: #selector(swipeActionRecognized))

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
        thirdViewOutput?.closeEventTriggered()
    }
}
