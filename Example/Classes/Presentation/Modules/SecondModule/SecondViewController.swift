//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule
import UIKit

final class SecondViewController: ViewController<SecondViewModel, Any, Any> {

    class Cell: UICollectionViewCell {
        lazy var label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = .black
            return label
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(label)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            label.frame = bounds
        }
    }

    private let reuseId = "cell"

    // MARK: - Subviews

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = .init(top: view.safeAreaInsets.top,
                                            left: 15,
                                            bottom: view.safeAreaInsets.bottom,
                                            right: 15)
        collectionView.register(Cell.self, forCellWithReuseIdentifier: reuseId)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad {
            view.addSubview(collectionView)
            view.backgroundColor = .white
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        collectionView.frame = view.bounds
    }

    override func update(with viewUpdate: Update<SecondViewModel>, animated: Bool) {
        viewUpdate(\.title) { title in
            navigationItem.title = title
        }

        collectionView.reloadData()
    }
}

extension SecondViewController: UICollectionViewDelegate {

}

extension SecondViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.listSectionItems.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId,
                                                            for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        cell.label.text = "\(viewModel.listSectionItems[indexPath.row])"
        return cell
    }
}

extension SecondViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset = collectionView.contentInset.left + collectionView.contentInset.right
        return CGSize(width: collectionView.bounds.width - inset, height: 100)
    }
}
