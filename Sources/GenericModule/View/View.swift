//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public protocol View: class {
    associatedtype Output
    associatedtype ViewModel: GenericModule.ViewModel
    associatedtype ViewInput

    var output: Output? { get set }

    init(viewModel: ViewModel)
    func update(with viewModel: ViewModel, force: Bool, animated: Bool)
}
