//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public protocol View: AnyObject {
    associatedtype Output
    associatedtype ViewModel: GenericModule.ViewModel
    associatedtype ViewInput

    var output: Output { get set }

    init(viewModel: ViewModel, output: Output)
    func update(with viewModel: ViewModel, force: Bool, animated: Bool)
}
