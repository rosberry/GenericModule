//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

final class MainViewModel: ViewModel {

    let title1: String
    let title2: String
    let title3: String
    let title4: String
    let title: String

    init(delegate: GenericViewModelDelegate<MainState>) {
        title1 = delegate.state.title1
        title2 = delegate.state.title2
        title3 = delegate.state.title3
        title4 = delegate.state.title4
        title = delegate.state.title
    }
}
