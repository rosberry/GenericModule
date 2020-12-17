//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

final class TitleTextViewModel: ViewModel<TitleTextState> {

    let title: String
    let text: String

    required init(state: TitleTextState) {
        title = state.title
        text = state.text
        super.init(state: state)
    }
}
