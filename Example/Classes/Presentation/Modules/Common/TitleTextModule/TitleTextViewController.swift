//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule
import UIKit

protocol TitleTextViewOutput {
    func closeEventTriggered()
}

class TitleTextViewController<Input, Output>: ViewController<TitleTextViewModel, Input, Output> {

    // MARK: - Subviews

    private(set) lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    // MARK: - Lifecycle

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

    override func update(with viewUpdate: Update<TitleTextViewModel>, animated: Bool) {
        viewUpdate(\.title) { title in
            navigationItem.title = title
        }

        viewUpdate(\.text) { text in
            label.text = text
        }
    }
}
