//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule
import UIKit

protocol TitleTextViewOutput {
    func closeEventTriggered()
}

class TitleTextViewController<Input, Output>: UIViewController {

    var viewModel: TitleTextViewModel
    var output: Output
    typealias ViewInput = Input

    // MARK: - Subviews

    private(set) lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    // MARK: - Lifecycle

    required init(viewModel: TitleTextViewModel, output: Output) {
        self.viewModel = viewModel
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .white
        if let output = output as? ViewOutput {
            output.viewDidLoad()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        label.frame = view.bounds
    }
}

extension TitleTextViewController: View, ForceViewUpdate {

    func update(with viewModel: TitleTextViewModel, force: Bool, animated: Bool) {
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
