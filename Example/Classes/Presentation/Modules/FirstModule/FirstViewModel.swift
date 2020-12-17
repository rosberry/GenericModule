//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

final class FirstViewModel: ViewModel<FirstState> {

    let title: String
    let title2: String
    let title3: String

    required init(state: FirstState) {
        title2 = state.title2
        title3 = state.title3
        title = state.title
        super.init(state: state)
    }
}
