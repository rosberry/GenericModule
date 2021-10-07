//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule
import UIKit

protocol MainViewOutput {
    func firstButtonEventTriggered()
    func secondButtonEventTriggered()
    func thirdButtonEventTriggered()
    func fourthButtonEventTriggered()
}

protocol MainViewInput {

}

final class MainViewController: ViewController<MainViewModel, MainViewInput, MainViewOutput> {

    // MARK: - Subviews

    private(set) lazy var firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(firstButtonPressed), for: .touchUpInside)
        return button
    }()

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

    private(set) lazy var fourthButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(fourthButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad {
            view.backgroundColor = .white
            view.addSubview(firstButton)
            view.addSubview(secondButton)
            view.addSubview(thirdButton)
            view.addSubview(fourthButton)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        firstButton.frame = CGRect(x: 16, y: 200, width: view.bounds.width - 32, height: 40)
        secondButton.frame = CGRect(x: 16, y: 300, width: view.bounds.width - 32, height: 40)
        thirdButton.frame = CGRect(x: 16, y: 400, width: view.bounds.width - 32, height: 40)
        fourthButton.frame = CGRect(x: 16, y: 500, width: view.bounds.width - 32, height: 40)
    }

    // MARK: - Actions

    @objc private func firstButtonPressed() {
        output.firstButtonEventTriggered()
    }

    @objc private func secondButtonPressed() {
        output.secondButtonEventTriggered()
    }

    @objc private func thirdButtonPressed() {
        output.thirdButtonEventTriggered()
    }

    @objc private func fourthButtonPressed() {
        output.fourthButtonEventTriggered()
    }

    override func update(with viewUpdate: Update<MainViewModel>, animated: Bool) {
        viewUpdate(\.title) { title in
            navigationItem.title = title
        }
        viewUpdate(\.title1) { title in
            firstButton.setTitle(title, for: .normal)
        }
        viewUpdate(\.title2) { title in
            secondButton.setTitle(title, for: .normal)
        }
        viewUpdate(\.title3) { title in
            thirdButton.setTitle(title, for: .normal)
        }
        viewUpdate(\.title4) { title in
            fourthButton.setTitle(title, for: .normal)
        }
    }
}

extension MainViewController: MainViewInput {

}
