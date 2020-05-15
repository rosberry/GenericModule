//
//  SecondViewController.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

protocol SecondViewOutput {
    func viewDidLoad()
}

final class SecondViewController: UIViewController {

    var output: SecondViewOutput?
    var viewModel: SecondViewModel

    // MARK: - Subviews

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    // MARK: - Lifecycle

    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .white
        output?.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        label.frame = view.bounds
    }
}

extension SecondViewController: ViewInput, ForceViewUpdate {

    func update(with viewModel: SecondViewModel, force: Bool, animated: Bool) {
        let oldViewModel = self.viewModel
        self.viewModel = viewModel

        update(new: viewModel, old: oldViewModel, keyPath: \.title, force: force) { title in
            navigationItem.title = title
        }
        update(new: viewModel, old: oldViewModel, keyPath: \.text, force: force) { text in
            label.text = text
        }
    }
}
