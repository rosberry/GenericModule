//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

protocol TitleTextViewOutput: ViewOutput {
    func closeEventTriggered()
}

class TitleTextViewController: UIViewController {

    var viewModel: TitleTextViewModel

    var output: ViewOutput?

    // MARK: - Subviews

    private(set) lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    // MARK: - Lifecycle

    required init(viewModel: TitleTextViewModel) {
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

extension TitleTextViewController: ViewInput, ForceViewUpdate {

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
