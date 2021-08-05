//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

final class FirstViewModelBuilder: ViewModelBuilder {

    var state: FirstState
    var title: String {
        state.title
    }

    init(state: FirstState) {
        self.state = state
    }
}

final class FirstViewModel: ViewModel {

    let title: String
    let title2: String
    let title3: String

    init(builder: GenericViewModelBuilder<FirstState>) {
        title = builder.state.title
        title2 = builder.state.title2
        title3 = builder.state.title3
    }
}
