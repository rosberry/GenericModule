//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

protocol FirstViewModelDelegate: AnyObject {
    var state: FirstState { get }
    func makeTitle() -> String
}

final class FirstViewModel: ViewModel {

    let title: String
    let title2: String
    let title3: String

    init(delegate: FirstViewModelDelegate) {
        title = delegate.makeTitle()
        title2 = delegate.state.title2
        title3 = delegate.state.title3
    }
}
