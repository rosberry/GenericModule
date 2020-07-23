//
//  MainVIewController.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

protocol MainViewOutput: ViewOutput {
    func firstButtonEventTriggered()
    func secondButtonEventTriggered()
    func thirdButtonEventTriggered()
}

final class MainViewController: UIViewController {

    var output: MainViewOutput?
    var viewModel: MainViewModel

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

    // MARK: - Lifecycle

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        output?.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        firstButton.frame = CGRect(x: 16, y: 200, width: view.bounds.width - 32, height: 40)
        secondButton.frame = CGRect(x: 16, y: 300, width: view.bounds.width - 32, height: 40)
        thirdButton.frame = CGRect(x: 16, y: 400, width: view.bounds.width - 32, height: 40)
    }

    // MARK: - Actions

    @objc private func firstButtonPressed() {
        output?.firstButtonEventTriggered()
    }

    @objc private func secondButtonPressed() {
        output?.secondButtonEventTriggered()
    }

    @objc private func thirdButtonPressed() {
        output?.thirdButtonEventTriggered()
    }
}

extension MainViewController: ViewInput, ForceViewUpdate {

    func update(with viewModel: MainViewModel, force: Bool, animated: Bool) {
        let oldViewModel = self.viewModel
        self.viewModel = viewModel

        update(new: viewModel, old: oldViewModel, keyPath: \.title, force: force) { title in
            navigationItem.title = title
        }
        update(new: viewModel, old: oldViewModel, keyPath: \.title1, force: force) { title in
            firstButton.setTitle(title, for: .normal)
        }
        update(new: viewModel, old: oldViewModel, keyPath: \.title2, force: force) { title in
            secondButton.setTitle(title, for: .normal)
        }
        update(new: viewModel, old: oldViewModel, keyPath: \.title3, force: force) { title in
            thirdButton.setTitle(title, for: .normal)
        }
    }
}
