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

    init(builder: GenericViewModelBuilder<MainState>) {
        title1 = builder.state.title1
        title2 = builder.state.title2
        title3 = builder.state.title3
        title4 = builder.state.title4
        title = builder.state.title
    }
}
