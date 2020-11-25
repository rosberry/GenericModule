//
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol ViewInput: HasOutput {

    associatedtype ViewModel

    var viewModel: ViewModel { get set }

    init(viewModel: ViewModel)
    func update(with viewModel: ViewModel, force: Bool, animated: Bool)
}

protocol ViewOutput {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}
