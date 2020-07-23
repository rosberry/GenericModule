//
//  SecondViewController.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

protocol SecondViewOutput: ViewOutput {
}


final class SecondViewController: UIViewController {

    class Cell: UICollectionViewCell {
        lazy var label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
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

    var output: SecondViewOutput?
    var viewModel: SecondViewModel

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
        return collectionView
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
        view.addSubview(collectionView)
        view.backgroundColor = .white
        output?.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        collectionView.frame = view.bounds
    }
}

extension SecondViewController: ViewInput, ForceViewUpdate {

    func update(with viewModel: SecondViewModel, force: Bool, animated: Bool) {
        let oldViewModel = self.viewModel
        self.viewModel = viewModel

        update(new: viewModel, old: oldViewModel, keyPath: \.title, force: force) { title in
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

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        cell.label.text = "\(viewModel.listSectionItems[indexPath.row])"
        return cell
    }
}

extension SecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
