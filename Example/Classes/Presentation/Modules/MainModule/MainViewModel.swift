//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

final class MainViewModel: ViewModel {

    let title1: String
    let title2: String
    let title3: String
    let title4: String
    let title: String

    required init(state: MainState) {
        title1 = state.title1
        title2 = state.title2
        title3 = state.title3
        title4 = state.title4
        title = state.title
    }
}
