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

class FirstViewController: UIViewController {

    typealias Output = FirstViewOutput & ViewOutput
    var output: Output
    var viewModel: FirstViewModel
    typealias ViewInput = FirstViewInput

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

    required init(viewModel: FirstViewModel, output: Output) {
        self.viewModel = viewModel
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        output.viewDidLoad()
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
}

extension FirstViewController: View, ForceViewUpdate {

    func update(with viewModel: FirstViewModel, force: Bool, animated: Bool) {

        let oldViewModel = self.viewModel
        self.viewModel = viewModel

        update(new: viewModel, old: oldViewModel, keyPath: \.title, force: force) { title in
            navigationItem.title = title
        }
        update(new: viewModel, old: oldViewModel, keyPath: \.title2, force: force) { title in
            secondButton.setTitle(title, for: .normal)
        }
        update(new: viewModel, old: oldViewModel, keyPath: \.title3, force: force) { title in
            thirdButton.setTitle(title, for: .normal)
        }
    }
}

extension FirstViewController: FirstViewInput {

}
