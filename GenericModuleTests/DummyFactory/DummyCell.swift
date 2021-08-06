//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import UIKit

final class DummyCell: UICollectionViewCell {

    private(set) lazy var label: UILabel = .init()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

    // MARK: - Private

    private func setup() {
        addSubview(label)
    }
}
