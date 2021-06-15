//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import UIKit
@testable import GenericModule

protocol DummyFactoryViewOutput {
    func userActionTriggered()
    func moduleActionTriggered()
}

protocol DummyFactoryViewInput {
    func performUserAction()
    func performModuleAction()
}

final class DummyFactoryViewController: UIViewController {

    typealias Output = DummyFactoryViewOutput & ViewOutput
    typealias ViewInput = DummyFactoryViewInput
    var output: Output
    var viewModel: DummyFactoryModel
    let cellIdentifier: String = "cell"

    // MARK: - Subviews

    private(set) lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - Lifecycle

    init(viewModel: DummyFactoryModel, output: Output) {
        self.viewModel = viewModel
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        Swift.fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(DummyCell.self, forCellWithReuseIdentifier: cellIdentifier)
        view.addSubview(collectionView)
        output.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output.viewWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        output.viewDidDisappear()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        collectionView.frame = view.bounds
    }
}

extension DummyFactoryViewController: View {

    func update(with viewModel: DummyFactoryModel, force: Bool, animated: Bool) {
        self.viewModel = viewModel
        collectionView.reloadData()
    }
}

extension DummyFactoryViewController: UICollectionViewDelegate {

}

extension DummyFactoryViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.listSectionItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? DummyCell else {
            return UICollectionViewCell()
        }
        let item = viewModel.listSectionItems[indexPath.row]
        cell.label.text = item
        return cell
    }
}

extension DummyFactoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.bounds.width, height: 100)
    }
}

extension DummyFactoryViewController: DummyFactoryViewInput {
    func performUserAction() {
        output.userActionTriggered()
    }

    func performModuleAction() {
        output.moduleActionTriggered()
    }
}
