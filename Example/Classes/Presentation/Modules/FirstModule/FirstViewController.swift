//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule
import UIKit

protocol FirstViewOutput {
    func secondButtonEventTriggered()
    func thirdButtonEventTriggered()
}

protocol FirstViewInput {

}

class FirstViewController: ViewController<FirstViewModel, FirstViewInput, FirstViewOutput> {

    // MARK: - Subviews

    private(set) lazy var secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(secondButtonPressed), for: .touchUpInside)
        return button
    }()

    private(set) lazy var thirdButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(thirdButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad {
            view.backgroundColor = .white
            view.addSubview(secondButton)
            view.addSubview(thirdButton)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        secondButton.frame = CGRect(x: 16, y: 200, width: view.bounds.width - 32, height: 40)
        thirdButton.frame = CGRect(x: 16, y: 300, width: view.bounds.width - 32, height: 40)
    }

    // MARK: - Actions

    @objc private func secondButtonPressed() {
        output.secondButtonEventTriggered()
    }

    @objc private func thirdButtonPressed() {
        output.thirdButtonEventTriggered()
    }

    override func update(with viewUpdate: Update<FirstViewModel>, animated: Bool) {
        viewUpdate(\.title) { title in
            navigationItem.title = title
        }
        viewUpdate(\.title2) { title in
            secondButton.setTitle(title, for: .normal)
        }
        viewUpdate(\.title3) { title in
            thirdButton.setTitle(title, for: .normal)
        }
    }
}

extension FirstViewController: FirstViewInput {

}
